

 
terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
 storage_account_name = "__terraformstorageaccount__"
     container_name       = "terraform3"
     key                  = "terraform.tfstate"
	access_key  ="aNEQGJVwLwAqcUi/cC1dUxZ4pKOs9W91z5ct/sNkmqwQLEvQGR8siW4thHWr/TvkRWizaO5ZIlkzazloC8Y7sA=="
  features{}
	}
	}
  provider "azurerm" {
    version = "=2.0.0"
features {}
}
resource "azurerm_resource_group" "dev1" {
  name     = "Terraform_ars"
  location = "West Europe"
}
resource "azurerm_app_service_plan" "dev1" {
  name                = "appserviceplan_ars"
  location            = "${azurerm_resource_group.dev1.location}"
  resource_group_name = "${azurerm_resource_group.dev1.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev1" {
  name                = "appservicename_ars"
  location            = "${azurerm_resource_group.dev1.location}"
  resource_group_name = "${azurerm_resource_group.dev1.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev1.id}"

}
