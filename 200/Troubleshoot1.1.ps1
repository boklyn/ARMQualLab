$resourceGroupName = "TroubleshootingRG"

# Uncomment to create the resource group if it does not already exist
#$location = "westus"
#New-AzureRmResourceGroup -ResourceGroupName $resourceGroupName -Location $location

$templateFileURI = "https://raw.githubusercontent.com/boklyn/ARMQualLab/master/200/Template1.json"
$parameters = @{}

$parameters.Add("storageAccountType","Standrd_GRS")
