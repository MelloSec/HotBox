mkdir c:\dev
# choco install -y --params "'/key:value key2:value'"
# choco install -y --params "'/InstallDir:C:\dev\<pkg>'"    < TODO: a variable for package and loop thorugh all these
# choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
# choco install -y mingw
# choco install -y mingw --x86 --force
choco install -y python3 --params "'/InstallDir:C:\dev\python3"'
choco install -y python2 --params "'/InstallDir:C:\dev\python2"'
choco install -y pip --params "'/InstallDir:C:\dev\pip"'
choco install -y golang --params "'/InstallDir:C:\dev\golang"'
choco install -y dotnet-sdk --params "'/InstallDir:C:\dev\dotnet-sdk"'
choco install -y dotnetcore-sdk --params "'/InstallDir:C:\dev\dotnetcore-sdk"'
choco install x64dbg.portable -y --params "'/InstallDir:C:\dev\x64dbg"'
choco install ollydbg -y --params "'/InstallDir:C:\dev\ollydb"'
choco install ida-free -y --params "'/InstallDir:C:\dev\ida-free"'
choco install cutter -y --params "'/InstallDir:C:\dev\cutter"'
choco install -y jre8 --params "'/InstallDir:C:\dev\jre8"'
choco install tcpview -y --params "'/InstallDir:C:\dev\tcpview"'
choco install -y wireshark 
choco install -y reshack --params "'/InstallDir:C:\dev\reshack"'
choco install -y poshgit
choco install -y asmspy --params "'/InstallDir:C:\dev\asmspy"'
choco install -y dnspy --params "'/InstallDir:C:\dev\dnspy"'
choco install -y sysinternals --params "'/InstallDir:C:\dev\sysinternals"'
choco install -y procmon
choco install -y hiew
choco install -y winpcap
choco install -y windump
Enable-RemoteDesktop

# install Pyinstaller and venv
mkdir C:\dev\pyinstaller 
cd C:\dev\pyinstaller
python3 -m venv c:\dev\pyinstaller
# pip3 install pyinstaller 

# Download JustDecompileEngine
cd c:\dev 
git clone https://github.com/telerik/JustDecompileEngine.git