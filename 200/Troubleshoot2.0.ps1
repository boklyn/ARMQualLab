$resourceGroupName = "TroubleshootingRG"
$templateFileURI = "NEED TO UPDATE"
$parameters = @{}

$parameters.Add("storageAccountType","Standard_GRS")

$testResults = Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental `
                                                   -TemplateUri $templateFileURI -TemplateParameterObject $parameters -Verbose

Write-Host 
Write-Host "Test Results" -ForegroundColor Green -NoNewline
$testResults