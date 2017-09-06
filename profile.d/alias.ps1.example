#######################################
#         PowerShell Aliases
# Sometimes Powershell can't run commands unless they're wrapped in a function
# http://stackoverflow.com/questions/38981044/the-term-is-not-recognized-as-cmdlet-function-script-file-or-operable-program
#######################################
# ..
Set-Alias -name ".." -value "cd.."
# e.
function explorerHere() {
    Start-Process -FilePath explorer.exe -argumentlist .
}
Set-Alias -name "e." -value "explorerHere"
# npmls
function listNpmGlobalModules() {
    npm ls -g --depth=0
}
Set-Alias -name "npmls" -value "listNpmGlobalModules"
# c
function goToCode() {
    cd ~\Code
}
Set-Alias -name "c" -value "goToCode"
# update
function chocoUpgrade() {
    choco upgrade all
}
Set-Alias -name "update" -value "chocoUpgrade"
# ls
Set-Alias ls Get-ChildItem-Color -option AllScope -Force
# status
function gitStatus($Path) {
    if (Test-Path -Path (Join-Path (Get-Item -Path ".\" -Verbose).FullName '.git') ) {
        git status 
    }
    else {
        write-host "there's no Git repo here!"
    }
}
Set-Alias -name "status" -value "gitStatus"
# chocolist 
function chocoListLocal() {
    choco list --local-only
}
Set-Alias -name "chocolist" -value "chocoListLocal"
