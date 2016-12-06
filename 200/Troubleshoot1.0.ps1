$resourceGroupName = "TroubleshootingRG"
$templateFileURI = "NEED TO UPDATE"
$parameters = @{}

$parameters.Add("storageAccountType","Standard_GRS")

Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental `
                                    -TemplateUri $templateFileURI -TemplateParameterObject $parameters -Verbose