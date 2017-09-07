$folderList = Import-Csv("goToFolder.config")

function Set-TargetFolder() {
    Param($folderAlias)
    $targetFolder = $folderList | Where-Object { $_.alias -eq $folderAlias }
    Set-Location $targetFolder.folder
}

Set-Alias -Name g -Value Set-TargetFolder