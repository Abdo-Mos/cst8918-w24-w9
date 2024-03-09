# Configure the Terraform runtime requirements.
terraform {
    required_version = ">= 1.1.0"
    required_providers {
        # Azure Resource Manager provider and version
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0.2"
        }
    }
}

# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}


resource "azurerm_resource_group" "resource_group" {
  name     = "iacLab9"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storageacct" {
  name                     = "lab9storageacc"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                     = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}