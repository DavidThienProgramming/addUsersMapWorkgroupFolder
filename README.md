Users and Workgroup Mapping
==========================

This is my first anything that I am putting up on github, so bear with me for a terrible README.

This is a script designed for windows computers set up to connect to a Windows Server workgroup.


This script was made because for set-up for a large group project that my school does every year. All of the seniors go out and basically act as a company for the week. I needed to make a script that would add in all of the users for the different comppanies, and then map the drive that was required to each user. Please note that this is by no means done efficiently or well, it was just done as quick as I could write it so that it could be done in time for setup.

In order to make the script run, first you have to copy the .bat files to a common directory so that it can find the files it needs to copy and run as it requires administrator permissions to run and lock the password for all of the users. The default directory is c:\Downloads\project\file.bat

First run the setup.bat file as an administrator which will copy the csv file into the C:\Windows\pass\file.csv directory by default. If the folder doesn't exist, then it will make it and will always hide it for at least a little protection against users. (I didn't have time to look into encrypting the file or anything and it doesn't work if the user doesn't have access to the file. This is protection enough against users for our purposes as it is unlikely that they would look for a password list, and certainly not in the windows directory (most likely).)

After the setup.bat file is run, it will make all of the users based off of values in the csv file and will then copy a login script to the C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\file.bat directory so that it will run whenever a user logs in. (It is copied here instead of the other startup folder so that it runs whenever any user logs in, not just the one that it was copied to.)

This script that was copied into the startup folder will iterate through the csv file and will check values in there against the currently logged in user. Once it finds a match, it will use those credentials to map the folder on the workgroup. The default path for the workgroup is \\WORKGROUP\user. This folder will be mapped under the U: drive and will automatically relogin whenever the user logs on. In case connection is lost, the script will still run whenever they log in. This is also in case another user wants to login so that another script doesn't have to be copied into the startup folder.
The format for the csv file is as follows:

username password username2 password2

Yes, this csv file doesn't actually use commas, but the script was broken when I did use commas and I probably didn't have time to fix it. This will most likely work without changes with a .txt or .tsv file, but at this point I haven't tested it with them.

NOTE: One annoying thing that I didn't get around to fixing before the script was needed is the issue of the mapping script itself. Currently when the user logs in, they will be able to see the command prompt flash briefly as the .bat file is run. This is probably an easy fix but, as mentioned, this project was under heavy time constraints and as of writing, I still haven't had time to fix it. This might get done eventually, but it is unlikely that I will come back to this project in the near future, so don't expect anything. If someone else wants to fix it then please do. Hopefully I have the settings configured right so that someone will be able to do that.
