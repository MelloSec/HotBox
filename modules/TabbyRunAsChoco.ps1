Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cinst -y tabby --install-arguments="'/DIR=C:\tabby'"
choco upgrade -y tabby
$tabby="C:\ProgramData\chocolatey\bin\tabby.exe"
$bytes = [System.IO.File]::ReadAllBytes($tabby)
$bytes[0x15] = $bytes[0x15] -bor 0x20 #set byte 21 (0x15) bit 6 (0x20) ON (Use –bor to set RunAsAdministrator option and –bxor to unset)
[System.IO.File]::WriteAllBytes($tabby, $bytes)