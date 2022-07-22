variable "client_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "client_secret" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "subscription_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "tenant_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}


 variable "location" {
   description = "Location of the resource group"
 }

variable "resourcegrp" {
  default = "resourcegroup name"
  
}