$resourceGroupName = "TroubleshootingRG"

# Uncomment to create the resource group if it does not already exist
#$location = "westus"
#New-AzureRmResourceGroup -ResourceGroupName $resourceGroupName -Location $location

$templateFileURI = "https://raw.githubusercontent.com/boklyn/ARMQualLab/master/200/Template2.json"
$parameters = @{}

$parameters.Add("storageAccountType","Standard_GRS")

$testResults = Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental `
                                                   -TemplateUri $templateFileURI -TemplateParameterObject $parameters -Verbose

Write-Host 
Write-Host "Test Results" -ForegroundColor Green -NoNewline
$testResults
