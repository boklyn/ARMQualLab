$resourceGroupName = "TroubleshootingRG"
$templateFileURI = "NEED TO UPDATE"
$parameters = @{}

$parameters.Add("storageAccountType","Standard_GRS")
$parameters.Add("storageAccountName", "armquallabteststorageacct")

$testResults = Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental `
                                   -TemplateUri $templateFileURI -TemplateParameterObject $parameters -Verbose

Write-Host 
Write-Host "Test Results" -ForegroundColor Green -NoNewline
$testResults