$resourceGroupName = "demo"  
$deploymentName = "storage-deployment"  
$storageAccountName = "task1storage"  
$containerName = "backupdata"  
  
  
  
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateUri "https://raw.githubusercontent.com/An1ket26/ps_codes/master/storage-template.json" -TemplateParameterObject @{"storageAccountName" = $storageAccountName "containerName" = $containerName}  