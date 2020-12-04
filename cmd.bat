#Non-Elevated Commands:


#Get .exe Version
wmic datafile where name="[FilePath]" get Version

#Get System Information
systeminfo

#Get IP Routing Table
route print




#Admin Only:

#Add User
net user [Username] [Password] /add

#Delete User
net user [Username] /delete

#Add User to this Computer's Primary Domain
net user [Username] [Password] /add /domain

#Delete User from this Computer's Primary Domain
net user [Username] /delete /domain

#Add User to Administrators localgroup
net localgroup Administrators [Username] /add

#Add User to Administrators group on the primary domain
net localgroup Administrators [Username] /add /domain

#Enable RDP
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

#Disable RDP
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f

#Allow RDP through firewall
netsh firewall set service remoteadmin enable
netsh firewall set service remotedesktop enable