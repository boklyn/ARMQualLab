$subid = "Enter your subscription ID" 
$location = "West US" 
$newrgname = "testing"
$parameters= @{"pubIpNameFormat"= "msft-pubip-"; "pubIpOffSet" = 5 ; "pubIpCount" =2} 
 
Add-AzureRmAccount 
Get-AzureRmSubscription -SubscriptionId $subid  | Set-AzureRmContext 
New-AzureRmResourceGroup -Name $newrgname -Location $location

New-AzureRmResourceGroupDeployment -Name "DeployName" -ResourceGroupName $newrgname -TemplateParameterObject $parameters -TemplateFile "Enter your Template File"