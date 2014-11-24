@echo off
::copies the mapping file to startup folder
copy C:\downloads\project\maplogin.bat "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\maplogin.bat"
::copies the password csv file to the c:\pass directory and hides it
md C:\windows\pass
attrib +h +r C:\windows\pass
copy C:\downloads\project\userspass.csv C:\windows\pass\userspass.csv
::creates all users
c:\downloads\project\addusers.bat
::enables do not display last username
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DontDisplayLastUserName" /t REG_DWORD /d 1 /f
