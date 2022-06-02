resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_D2_v2"
    }

# There are many ways to authenticate to the Azure provider. In this demo we will use service principal.

    service_principal {
        client_id     = var.aks_service_principal_app_id
        client_secret = var.aks_service_principal_client_secret
    }

# In case you want to use system managed identity

#   identity {
#       type = "SystemAssigned"
#  }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "Development"
    }
}
