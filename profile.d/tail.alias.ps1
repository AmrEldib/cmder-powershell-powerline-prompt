function tailFile(){
<#
.SYNOPSIS
tail a File
.DESCRIPTION
Powershell equivalent of Unix `tail --follow`
.PARAMETER filePath
Path to the file to tail
.INPUTS
A text file
.OUTPUTS
Text added to the file in real-time
#>

    [CmdletBinding()]
    Param(
        [parameter(mandatory=$true,
        HelpMessage="File to tail.")]
        [ValidateScript({Test-Path $_})]
        [String]
        $filePath
    )
    Get-Content $filePath -Wait
}

Set-Alias -name "tail" -value "tailFile"