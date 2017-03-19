# cmder-powershell-powerline-prompt

## Setting up files in Cmder config folder

It's better to store the files of this repo in its own folder so that it can be updated easily without messing up other files.  
However, user profiles files must be reside in `%CMDER%\config` folder. We can use symlinks to get around that.  

Create symlink to `user-profile.ps1`  
```powershell
new-item -path c:\bin\cmder\config\user-profile.ps1 -itemtype symboliclink -value <path to repo folder>\cmder-powershell-powerline-prompt\user-profile.ps1
```

Create symlink to `profile.d` folder  
```powershell 
new-item -path c:\bin\cmder\config\profile.d -itemtype symboliclink -value <path to repo folder>\cmder-powershell-powerline-prompt\profile.d
```