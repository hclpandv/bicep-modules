// Naming standards adopted from azure caf
targetScope = 'subscription'

@maxLength(8)
param applicationName string

@allowed([
  'dev'
  'tst'
  'qas'
  'prd'
])
param environment string

@maxLength(3)
param regionCode string
param instanceNumber int

var environmentLetter = substring(environment,0,1)

output vnet string = 'vnet-${applicationName}-${environmentLetter}-${regionCode}-${instanceNumber}'
output resourceGroup string = 'rg-${applicationName}-${environmentLetter}-${regionCode}-${instanceNumber}'
