@description('The name of the Azure storage resource')
@minLength(3)
@maxLength(24)
param storageName string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param storageSKU string = 'Standard_LRS'

resource storage 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageName
  tags: {
    displayName: storageName
  }
  location: resourceGroup().location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

output storageEndpoint object = storage.properties.primaryEndpoints
