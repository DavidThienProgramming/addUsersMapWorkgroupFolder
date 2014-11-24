::Runs at login will iterate through the list until it finds the correct user
::and will then use their credentials to map the drive
@echo off

for /f "tokens=1,2 delims= " %%a in (C:\windows\pass\userspass.csv) do (
 IF %%a==%USERNAME% (
  net use u: \\WORKGROUP\%%a %%b /user:%%a /persistent:yes
 )
)
