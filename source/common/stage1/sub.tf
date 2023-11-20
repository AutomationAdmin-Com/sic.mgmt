
# data "azurerm_billing_mca_account_scope" "billing" {
#   billing_account_name = "aa-billing-account-1"
#   billing_profile_name = "aa-billing-profile-1"
#   invoice_section_name = "aa-invoice-section-1"
# }

resource "azurerm_subscription" "nonprd_hub" {
  subscription_name = "nonprd-hub"
  #billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}

resource "azurerm_subscription" "nonprd_spk" {
  subscription_name = "nonprd-spoke"
  #billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}

resource "azurerm_subscription" "prd_spk" {
  subscription_name = "prd-spoke"
  #billing_scope_id  = data.azurerm_billing_mca_account_scope.billing.id
}
