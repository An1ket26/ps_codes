$resourceGroupName = "demo"  
$deploymentName = "storage-deployment"  
$storageAccountName = "task1storage"  
$containerName = "backupdata"  
  
  
  
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName `  
  -TemplateUri "storage-template.json" `  
  -TemplateParameterObject @{  
    "storageAccountName" = $storageAccountName  
    "containerName" = $containerName  
  }  