// main.bicep
targetScope = 'subscription'


// Deploy the resource group module
module rgModule 'local_modules/resourceGroup.bicep' = {
  name: '${deployment().name}-resourceGroupDeploy'
  params: {
    resourceGroupName: 'rg-test-bicep-03'
    location: 'westeurope'
  }
}

// Define the storage account module (to be deployed at resource group scope)
module storageModule 'local_modules/storageAccount.bicep' = {
  name: '${deployment().name}-storageDeploy'
  scope: resourceGroup('rg-test-bicep-03')
  params: {
    storageAccountName: 'st386vikiscripts'
    location: 'westeurope'
  }
  dependsOn: [
    rgModule
  ]
}

// Output the resource group ID
output resourceGroupId string = rgModule.outputs.resourceId
