provider "azurerm" {
  features {}
}

data "azurerm_subscription" "primary" {
}

resource "azuread_user" "test1" {
  user_principal_name = "test1@rehankashyap735gmail.onmicrosoft.com"
  display_name        = "Test 1"
  password            = "Raj@12345"
}

resource "azurerm_role_assignment" "Adding_Reader_Role" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = azuread_user.test1.object_id
}