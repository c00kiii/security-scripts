#Non-Elevated:

#Get AD Users by Group
Get-ADGroupMember -Identity "[Group]"

#List shared drives
Get-WmiObject -class Win32_Share

#Select only unique values
[Collection Name] | select -uniq

#Search Socials
Get-ChildItem  -rec | ?{ findstr.exe /mprc:. $_.FullName } | select-string " [0-9]{3}[-| ][0-9]{2}[-| ][0-9]{4}"

#Search Credit Cards
Get-ChildItem  -rec | ?{ findstr.exe /mprc:. $_.FullName } | select-string " [0-9]{4}[-| ][0-9]{4}[-| ][0-9]{4}[-| ][0-9]{4}"



#Admin Only:

#Enable RDP
(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1)
(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)

#Enable firewall rule
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#Add "Open Admin Powershell window here" to SysMenu
$menu = 'Open Admin PowerShell here'
$command = "$PSHOME\powershell.exe -NoExit -NoProfile -Command ""Set-Location '%V'"""
'directory', 'directory\background', 'drive' | ForEach-Object {
    New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name runas\command -Force |
    Set-ItemProperty -Name '(default)' -Value $command -PassThru |
    Set-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu -PassThru |
    Set-ItemProperty -Name HasLUAShield -Value ''
}