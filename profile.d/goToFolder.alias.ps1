$folderList = Import-Csv("goToFolder.config")
$aliases = $folderList | Select-Object -ExpandProperty alias

function Set-TargetFolder() {
    [CmdletBinding()]
    Param()
        DynamicParam {
            $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
            $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            
            $parameterName = 'folderToAlias'
            $parameterAttribute = New-Object System.Management.Automation.ParameterAttribute
            $parameterAttribute.Mandatory = $true
            $parameterAttribute.Position = 0
            $attributeCollection.Add($parameterAttribute)
            
            $validateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($aliases)
            $attributeCollection.Add($validateSetAttribute)

            $runtimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($parameterName, [string], $attributeCollection)
            $paramDictionary.Add($runtimeParameter.Name, $runtimeParameter)
            

            return $paramDictionary
        }

        begin {
            $folderAlias = $PSBoundParameters[$ParameterName]
        }

        process {
            $targetFolder = $folderList | Where-Object { $_.alias -eq $folderAlias }
            Set-Location $targetFolder.folder
        }
}

Set-Alias -Name g -Value Set-TargetFolder