

 
terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
 storage_account_name = "__terraformstorageaccount__"
     container_name       = "terraform3"
     key                  = "terraform.tfstate"
	access_key  ="aqS4vrWX4EF29VbI9XH/WEYrs/QNNJhPZF9CRod8D8JrG+Bcy0OTGL++7FHuLJV+jbQON60RKBuc56vW2hEqvA=="
		 //"aNEQGJVwLwAqcUi/cC1dUxZ4pKOs9W91z5ct/sNkmqwQLEvQGR8siW4thHWr/TvkRWizaO5ZIlkzazloC8Y7sA=="
  features{}
	}
	}
  provider "azurerm" {
    version = "=2.0.0"
features {}
}
resource "azurerm_resource_group" "dev1" {
  name     = "Terraform_ars"    #created for app service and app service plan.. for storage of tf state file another resource group is used
  location = "West Europe"
}
resource "azurerm_app_service_plan" "dev1" {
  name                = "appserviceplanars"
  location            = "${azurerm_resource_group.dev1.location}"
  resource_group_name = "${azurerm_resource_group.dev1.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev1" {
  name                = "appservicenamears"
  location            = "${azurerm_resource_group.dev1.location}"
  resource_group_name = "${azurerm_resource_group.dev1.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev1.id}"

}
