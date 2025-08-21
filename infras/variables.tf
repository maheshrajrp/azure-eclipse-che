variable "project_name" {
  type = string
  default = "eclipseche-poc"
}

variable "azure_region" {
  type = string
  default = "eastus2"
}

variable "tenant_id" {
  type = string
  nullable = false
}

variable "azure_admin_group_id" {
  type = list(string)
  default = []
}