$resourceGroupName = "demo"  
$deploymentName = "storage-deployment"  
$storageAccountName = "aniketstorage"  
$containerName = "backupdata"  
  
New-AzResourceGroup -name $resourceGroupName -location "EASTUS"
  
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName `
-TemplateFile "C:\Users\aniket\Desktop\ps_cmds\storage-template.json" `
-TemplateParameterObject @{"storageAccountName" = $storageAccountName 
"containerName" = $containerName}  

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -AccountName $storageAccountName).Value[0]  
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey  
Set-AzStorageBlobContent -Context $storageContext -Container $containerName -File "C:\Users\aniket\Desktop\ps_cmds\sql_backup.txt" -Blob "blob1"