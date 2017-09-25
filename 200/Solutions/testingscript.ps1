$subid = "ENTER IN YOUR SUBSCRIPTION ID" 
$location = "West US" 
$newrgname = "testing" 
 
Add-AzureRmAccount 
Get-AzureRmSubscription -SubscriptionId $subid  | Set-AzureRmContext 
New-AzureRmResourceGroup -Name $newrgname -Location $location

New-AzureRmResourceGroupDeployment -ResourceGroupName $newrgname -Name "DeployName" -TemplateFile "ENTER IN LOCAL PATH TO JSON FILE"
