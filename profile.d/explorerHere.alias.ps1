# e.
function explorerHere() {
    Start-Process -FilePath explorer.exe -argumentlist .
}

Set-Alias -name "e." -value "explorerHere"