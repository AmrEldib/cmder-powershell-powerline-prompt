# Use this file to run your own startup commands

#######################################
#         Prompt Customization
#######################################
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

function Import-GitModule($Loaded){
    if($Loaded) { return }
    $GitModule = Get-Module -Name Posh-Git -ListAvailable
    if($GitModule | Select-Object version | Where-Object version -le ([version]"0.6.1.20160330")){
        Import-Module Posh-Git > $null
    }
    if(-not ($GitModule) ) {
        Write-Warning "Missing git support, install posh-git with 'Install-Module posh-git' and restart cmder."
    }
    # Make sure we only run once by alawys returning true
    return $true
}



$isGitLoaded = $false
#Anonymice Powerline
$arrowSymbol = [char]0xE0B0;
$branchSymbol = [char]0xE0A0;

$defaultForeColor = "White"
$defaultBackColor = "Black"
$pathForeColor = "White"
$pathBackColor = "DarkBlue"
$gitCleanForeColor = "White"
$gitCleanBackColor = "Green"
$gitDirtyForeColor = "Black"
$gitDirtyBackColor = "Yellow"

function Write-GitPrompt() {
    $status = Get-GitStatus

    if ($status) {

        # assume git folder is clean
        $gitBackColor = $gitCleanBackColor
        $gitForeColor = $gitCleanForeColor
        if ($status.HasWorking -Or $status.HasIndex) {
            # but if it's dirty, change the back color
            $gitBackColor = $gitDirtyBackColor
            $gitForeColor = $gitDirtyForeColor
        }

        # Close path prompt
        Write-Host $arrowSymbol -NoNewLine -BackgroundColor $gitBackColor -ForegroundColor $pathBackColor

        # Write branch symbol and name
        Write-Host " " $branchSymbol " " $status.Branch " " -NoNewLine -BackgroundColor $gitBackColor -ForegroundColor $gitForeColor

        <# Git status info
        HasWorking   : False
        Branch       : master
        AheadBy      : 0
        Working      : {}
        Upstream     : origin/master
        StashCount   : 0
        Index        : {}
        HasIndex     : False
        BehindBy     : 0
        HasUntracked : False
        GitDir       : D:\amr\SourceCode\DevDiary\.git
        #>

        # close git prompt
        Write-Host $arrowSymbol -NoNewLine -BackgroundColor $defaultBackColor -ForegroundColor $gitBackColor
    }
}

function getGitStatus($Path) {
    if (Test-Path -Path (Join-Path $Path '.git') ) {
        $isGitLoaded = Import-GitModule $isGitLoaded
        Write-GitPrompt
        return
    }
    $SplitPath = split-path $path
    if ($SplitPath) {
        getGitStatus($SplitPath)
    }
    else{
      Write-Host $arrowSymbol -NoNewLine -ForegroundColor $pathBackColor
    }
}

function tildaPath($Path) {
    return $Path.replace($env:USERPROFILE, "~")
}

# Replace the cmder prompt entirely with this.
[ScriptBlock]$CmderPrompt = {
    $tp = tildaPath($pwd.ProviderPath)
    Microsoft.PowerShell.Utility\Write-Host "`n" $tp " " -NoNewLine -BackgroundColor $pathBackColor -ForegroundColor $pathForeColor

    getGitStatus($pwd.ProviderPath)
}


[ScriptBlock]$PostPrompt = {
}

## <Continue to add your own>

