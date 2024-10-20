// test bicep deploy
targetScope = 'subscription'

param resourceGroupName string
param location string

resource myResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

output resourceId string = myResourceGroup.id
