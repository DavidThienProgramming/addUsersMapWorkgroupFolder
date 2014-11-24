::Make all Users
@echo off
for /f "tokens=1,2 delims= " %%a in (C:\windows\pass\userspass.csv) do (
 net user %%a %%b /passwordchg:no /add
)
