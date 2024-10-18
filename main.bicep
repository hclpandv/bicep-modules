// Vars
//
targetScope = 'subscription'

var deploymentRegion = 'westeurope'

var resourceGroupNames = [
  'd-viki-we-rg-iaas1'
  'd-viki-we-rg-network1'
  'd-viki-we-rg-paas1'
]

// main deployments
//
@batchSize(3)// Adjust batch size as needed
resource myResourceGroups 'Microsoft.Resources/resourceGroups@2021-04-01' = [for resourceGroupName in resourceGroupNames: {
  name: resourceGroupName
  location: deploymentRegion
}]


// Define the storage account module (to be deployed at resource group scope)
module storageModule 'local_modules/storageAccount.bicep' = {
  name: '${deployment().name}-storageDeploy'
  scope: resourceGroup('d-viki-we-rg-iaas1')
  params: {
    storageAccountName: 'st786vikiscripts'
    location: 'westeurope'
  }
  dependsOn: [
    myResourceGroups
  ]
}


// Outputs -- failing.. please fix
//
// output resourceGroupIds array = [for i in range(0, length(resourceGroupNames)): { 
//   id: myResourceGroups(i).id
// }]
