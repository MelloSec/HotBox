# Install the Windows feature for FTP
Install-WindowsFeature Web-FTP-Server -IncludeAllSubFeature
Install-WindowsFeature Web-Server -IncludeAllSubFeature  IncludeManagementTools

# Import the module
Import-Module WebAdministration

# Create the FTP site
mkdir 'C:\BadIdeas'
$FTPSiteName = 'MelloSec'
$FTPRootDir = 'C:\BadIdeas'
$FTPPort = 21
New-WebFtpSite -Name $FTPSiteName -Port $FTPPort -PhysicalPath $FTPRootDir

# The right way...

# Create the local Windows group
$FTPUserGroupName = "FTP Users"
$ADSI = [ADSI]"WinNT://$env:ComputerName"
$FTPUserGroup = $ADSI.Create("Group", "$FTPUserGroupName")
$FTPUserGroup.SetInfo()
$FTPUserGroup.Description = "Members of this group can connect through FTP"
$FTPUserGroup.SetInfo()

# Create an FTP user
$FTPUserName = "FTPUser"
$FTPPassword = 'P@ssword123'
$CreateUserFTPUser = $ADSI.Create("User", "$FTPUserName")
$CreateUserFTPUser.SetInfo()
$CreateUserFTPUser.SetPassword("$FTPPassword")
$CreateUserFTPUser.SetInfo()

# Add an FTP user to the group FTP Users
$UserAccount = New-Object System.Security.Principal.NTAccount("$FTPUserName")
$SID = $UserAccount.Translate([System.Security.Principal.SecurityIdentifier])
$Group = [ADSI]"WinNT://$env:ComputerName/$FTPUserGroupName,Group"
$User = [ADSI]"WinNT://$SID"
$Group.Add($User.Path)

# Enable basic authentication on the FTP site
$FTPSitePath = "IIS:\Sites\$FTPSiteName"
$BasicAuth = 'ftpServer.security.authentication.basicAuthentication.enabled'
Set-ItemProperty -Path $FTPSitePath -Name $BasicAuth -Value $True
# Add an authorization read rule for FTP Users.
$Param = @{
    Filter   = "/system.ftpServer/security/authorization"
    Value    = @{
        accessType  = "Allow"
        roles       = "$FTPUserGroupName"
        permissions = 1
    }
    PSPath   = 'IIS:\'
    Location = $FTPSiteName
}
Add-WebConfiguration @param



# Allow SSL, not require
$SSLPolicy = @(
    'ftpServer.security.ssl.controlChannelPolicy',
    'ftpServer.security.ssl.dataChannelPolicy'
)
Set-ItemProperty -Path $FTPSitePath -Name $SSLPolicy[0] -Value $false
Set-ItemProperty -Path $FTPSitePath -Name $SSLPolicy[1] -Value $false

# The commands below set the NTFS permissions on the FTPRoot folder to allow the FTP user group to access the files.
$UserAccount = New-Object System.Security.Principal.NTAccount("$FTPUserGroupName")
$AccessRule = [System.Security.AccessControl.FileSystemAccessRule]::new($UserAccount,
    'ReadAndExecute',
    'ContainerInherit,ObjectInherit',
    'None',
    'Allow'
)
$ACL = Get-Acl -Path $FTPRootDir
$ACL.SetAccessRule($AccessRule)
$ACL | Set-Acl -Path $FTPRootDir

# Restart the FTP site for all changes to take effect
Restart-WebItem "IIS:\Sites\$FTPSiteName" -Verbose