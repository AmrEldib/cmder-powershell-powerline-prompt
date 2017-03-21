# cmder-powershell-powerline-prompt

Custom prompt (and other configurations) for PowerShell in [Cmder](http://cmder.net/).  

![Screenshot](Screenshot.png)

## Aliases
Store aliases in its own PowerShell script under the `profile.d` folder in a file (for example) named `alias.ps`.  
There's an example for how to create an alias file in `alias.ps1.example`.  

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