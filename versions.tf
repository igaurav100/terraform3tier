# terraform block 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}
provider "azurerm" {
  features {}
  # Configuration options
}