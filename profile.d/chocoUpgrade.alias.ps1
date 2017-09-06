# upgrade
function chocoUpgrade() {
    choco upgrade all
}

Set-Alias -name "upgrade" -value "chocoUpgrade"