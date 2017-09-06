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