#Level 100
__Getting Started__
===============
To complete this lab you will need to download Azure PowerShell and Visual Studio Express. You will create the ARM template in Visual Studio, and execute it through a PowerShell script.

	1. Preparations
		i. Install Azure PowerShell
			* https://azure.microsoft.com/en-us/documentation/articles/powershell-install-configure/
				1. If error occurs when executing Azure commands in PowerShell, run  "enable set-executionpolicy unrestricted". 
		ii. Download and leverage Visual Studio Express with Azure SDK integration for VS 2015
			* https://www.visualstudio.com/downloads/
			* https://azure.microsoft.com/en-us/blog/announcing-visual-studio-azure-tools-and-sdk-2-9/
				1. To create a JSON file go to File> New File> Web >JSON

	2. Review resources:
	https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/
		i. Understand the concept of Expressions and Functions. 
			• https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/#expressions-and-functions
		ii. Understand the concept of parameters within JSON
			• https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/#parameters
			• Understand the usage of allowed values. 
		iii. Understand the concept of variables. 
			• https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/#variables
			• Be able to answer: How are variables different from parameters? Why and when should they be used?
		iv. Understand the concept of resources. 
			• https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/#resources
		v. Understand the concept of outputs
			• https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/#outputs
		vi. Leverage the blank template located at: https://github.com/Azure/azure-quickstart-templates/tree/master/100-blank-template. Use the raw option and import into a JSON file in Visual Studio.
		vii. Understanding PowerShell and Azure cmdlets: https://docs.microsoft.com/en-us/powershell/, and https://azure.microsoft.com/en-us/documentation/articles/resource-manager-template-walkthrough/#deploying-the-template
			
	Validation Phase:
		a. Create your first Azure resource group PowerShell script with the following code:
		$subid = ""
			• Use the subscription ID from your personal Azure account
		$location = "South Central US"
			• You can choose a location closer to you (I.e. West US)
		$newrgname = "testing"
		
		Add-AzureRmAccount
		Get-AzureRmSubscription -SubscriptionId $subid  | Set-AzureRmContext
		New-AzureRmResourceGroup -Name $newrgname -Location $location
		
		b. Use the code in 2a with the added code:
		New-AzureRmResourceGroupDeployment -ResourceGroupName $newrgname -Name "DeployName" -TemplateFile "azuredeploy.json".

		where azuredeploy.json is your blank template. Run ARM PowerShell script to successfully deploy the blank JSON template.
		
		c. Add one parameter called "storageAccountType" to the JSON code with default value of "Standard_LRS" (type: string) and another parameter called "storageAccountName" without a default value (type: string). Use PowerShell to successfully execute your basic template successfully.  (Hint: Only run the last line of the PowerShell script each time you want to test your template)
			• Recommend using an IDE or text editor that at the minimum understands JSON (e.g. Visual Studio, VS Code, etc.). Visual studio 2015 with Azure SDK installed is the preferred choice 
		d. Add one variable called "storageAccountNamevar" with the string value of "placeholder" from the previous successfully executed template. Validate by successfully executing the template. 
		e. Add an output section in the JSON template referencing each of the parameters and the variable created in the previous steps. Execute the template and confirm your output data is valid. For additional information pleas refer back to the 2v, "Understand the concept of outputs"
		
		
	3. Review Resources:
		i. Read through the differences between the ARM and ASM management models https://azure.microsoft.com/en-us/documentation/articles/resource-manager-deployment-model/
	Validation phase: 
		a. Understand the difference between ARM and the ASM model. 
	4. Review Resources:
		i. Review the different type of ARM template functions for numbers, strings, arrays, deployment values, and resources https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-functions/
	Validation Phase: 
		a. Understanding the following string functions
			i. Concat
				1. Leverage the template created in step 1 to modify the variable created in 2d to hold the concat value between the "storageAccountName" parameter created in 2c and the string "end"
		b. Understanding the following functions:
			i. Resource group
				1. Create a new variable that would hold the resourcegroup.location property of the deployment. Modify the output section to include this new variable. 
	5. Review Resources:
		i. Read through the best practices around authoring ARM templates https://azure.microsoft.com/en-us/documentation/articles/resource-manager-template-best-practices/
	Validation Phase: Successfully modify the previous template with the following requirements
		a. Parameters leveraging camelCasing
		b. Leverage powershell to deploy the created template into your azure subscription
	6. Understanding PowerShell and ARM templates, create and deploy your first basic resource, a storage account. The ARM template should adhere to these constraints:
		a. Create a storage account resource and include a comment element.  See 2iv link for additional information in injecting comments.
		b. The type of storage account should be a parameter with the following allowed options locked in:
			? "Standard_LRS",
			"Standard_GRS",
			"Standard_ZRS",
			"Premium_LRS"
		c. If the resource group already exists, assume the storage account should be deployed in the same Azure region as the resource group so the user executing the template does not have to pass the location as a parameter.
	Here is a sample code for a storage account resource.
	{
	  "type": "Microsoft.Storage/storageAccounts",
	  "name": "[variables('storageAccountNamevar')]",
	  "apiVersion": "2016-01-01",
	  "location": "[resourceGroup().location]",
	  "sku": {
		  "name": "[parameters('storageAccountType')]"
	  },
	  "kind": "Storage", 
	  "properties": {
	  }
	}
	
	Validation phase:
		a. Upon completion your template should look Similar to the one from the following URL: https://github.com/Azure/azure-quickstart-templates/tree/master/101-storage-account-create
	
	
Final Validation exercise. 
Create and successfully deploy a public IP resource with the following requirements based on the starting sample code of:
{
      "apiVersion": "",
      "type": "Microsoft.Network/publicIPAddresses",
      "name": "",
      "location": "[]",
      "properties": {
        "publicIPAllocationMethod": "Dynamic"
      }
    }

	a. For the value of the apiVersion add a variable with value of "2015-05-01-preview" and reference that variable 
	b. The public ip resource name should be retrieved from a parameter named: pubipname
	c. The public ip resource location value should leverage the resourcegroup function to pull the location
	d. Have the output of the template return the parameter for the public ip name. 
	e. Comment the public IP resource with the value "This is the public ip resource" 

