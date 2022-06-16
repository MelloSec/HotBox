$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Windows Terminal.lnk")
$Shortcut.TargetPath = "$env:LOCALAPPDATA\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe"
$Shortcut.Save()

$bytes = [System.IO.File]::ReadAllBytes("$Home\Desktop\Windows Terminal.lnk")
$bytes[0x15] = $bytes[0x15] -bor 0x20 #set byte 21 (0x15) bit 6 (0x20) ON
[System.IO.File]::WriteAllBytes("$Home\Desktop\Windows Terminal.lnk", $bytes)