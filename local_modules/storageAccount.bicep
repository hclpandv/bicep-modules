// storageModule.bicep
targetScope = 'resourceGroup'

param storageAccountName string
param location string

resource myStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Output the resource ID of the created storage account
output resourceId string = myStorageAccount.id
