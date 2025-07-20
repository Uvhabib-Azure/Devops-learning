terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "a441db28-e236-4702-8fd2-4db0526d8d28"
}

resource "azurerm_resource_group" "rg" {
  name     = "my-rg"
  location = "westus2"
}

resource "azurerm_resource_group" "rg-2" {
  name     = "my-rg2"
  location = "West Europe"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  location            = azurerm_resource_group.rg-2.location
  resource_group_name = azurerm_resource_group.rg-2.name
  address_space       = ["10.0.0.0/16"]


  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
}



