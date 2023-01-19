variable "environment" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Valid value is one of the following: dev, prod."
  }
}

variable "location" {
  type        = string
  description = "Location of resources"
  default     = "eastus"
}