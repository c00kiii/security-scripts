#Non-Elevated:

#Display Running Processes
ps aux

#Display Running Processes by User
ps -u [Username}

#Get Running Process ID by Name
pgrep [Name]


#Delete At Jobs by User
find /var/spool/at/ -name "[^.]*" -type f -user [Username] -delete

#Remove Cron Jobs by User
crontab -r - u [Username]

#Remove Print Jobs by User
lprm [Username]




#Admin Only:

#Create New User
useradd [Username]

#Set User Password
passwd [Username]

#Lock a User
passwd -l [Username]

#Delete User
userdel [Username]

#Delete User and Home Dir/Mail Spool
userdel -r [Username]

#Force Delete User and Home Dir/Mail Spool
userdel -r -f [Username]

#Modify File/Folder Permissions by User:
setfacl -m u:[Username]:rwx [File/Folder]