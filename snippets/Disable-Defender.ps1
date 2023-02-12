iwr https://github.com/jbara2002/windows-defender-remover/releases/download/release_def_12_0_0/Defender.Remover.12.exe -o Defender.Remover.12.exe|Start-Process

$hostname = $(hostname)

# Disabling the progress bar speeds up IWR https://github.com/PowerShell/PowerShell/issues/2138
$ProgressPreference = 'SilentlyContinue'
# GitHub requires TLS 1.2 as of 2/27
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Windows Defender should be disabled already by the GPO
# Change this to jus grab current users profile to exlcude 
If ($hostname -eq "win10" -And (Get-Service -Name WinDefend).StartType -ne 'Disabled' ) {
  # Adding Defender exclusions just in case
  Set-MpPreference -ExclusionPath "C:\Tools"
  Add-MpPreference -ExclusionPath "C:\Users\vagrant\AppData\Local\Temp"

  . c:\vagrant\scripts\Invoke-CommandAs.ps1
  Invoke-CommandAs 'NT SERVICE\TrustedInstaller' {
    Set-Service WinDefend -StartupType Disabled
    Stop-Service WinDefend
  }
}

# Windows Defender should be disabled by the GPO or uninstalled already, but we'll keep this just in case
If ($hostname -ne "win10" -And (Get-Service -Name WinDefend -ErrorAction SilentlyContinue).status -eq 'Running') {
  # Uninstalling Windows Defender (https://github.com/StefanScherer/packer-windows/issues/201)
    Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Uninstalling Windows Defender..."
  Try {
    Uninstall-WindowsFeature Windows-Defender -ErrorAction Stop
    Uninstall-WindowsFeature Windows-Defender-Features -ErrorAction Stop
  } Catch {
    Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Windows Defender did not uninstall successfully..."
    Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) We'll try again during install-red-team.ps1"
  }
} Else  {
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Windows Defender has already been disabled or uninstalled."
}