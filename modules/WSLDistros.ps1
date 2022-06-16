Invoke-WebRequest -Uri https://aka.ms/wsl-kali-linux-new -OutFile Kali.appx -UseBasicParsing
Add-AppxPackage .\kali.appx

Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu20.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu20.appx


