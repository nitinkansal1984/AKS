variable "resource_group_name" {
  default       = "myResourceGroup"
}

variable "resource_group_location" {
  default       = "eastus"
  description   = "Location of the resource group."
}

variable "agent_count" {
    default = 1
}

variable "dns_prefix" {
    default = "myAKSCluster"
}

variable cluster_name {
    default = "myAKSCluster"
}

## In case you are using service prinicipal to authenticate to resource provider
variable aks_service_principal_app_id {
}

variable aks_service_principal_client_secret {
}
