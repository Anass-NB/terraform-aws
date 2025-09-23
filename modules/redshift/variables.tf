variable "region" {
  type        = string
  description = "AWS region to deploy the resources"
  default     = "eu-west-3"
}

variable "redshift_config" {
  type        = any
  description = "Configuration object for redshift from YAML file"
}

