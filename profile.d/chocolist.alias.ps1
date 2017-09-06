# chocolist 
function chocoListLocal() {
    choco list --local-only
}

Set-Alias -name "chocolist" -value "chocoListLocal"