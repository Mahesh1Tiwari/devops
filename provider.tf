terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Optional: Configure the provider to use a specific subscription
  subscription_id = "5550159f-a390-4764-9640-fc8da172b2d3"

 }
