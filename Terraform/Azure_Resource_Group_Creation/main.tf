#Sets up AZ provider in Terraform
provider "azurerm" {
  features {}
}

#Defines Resource Group in Azure.
resource "azurerm_resource_group" "Test" {
  name     = "my-resource-group"
  location = "westus"
}
