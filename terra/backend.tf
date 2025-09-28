# # backend.tf
# terraform {
#     backend "azurerm" {
#         resource_group_name  = "tfstate-rg"
#         storage_account_name = "tfstatestorageacct"
#         container_name       = "tfstate"
#         key                  = "terraform.tfstate"
#     }
# }

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "rg-terraform-state"
#     storage_account_name = "tfstateaccount"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }
# }

