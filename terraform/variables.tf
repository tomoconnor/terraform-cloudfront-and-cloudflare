# GENERAL
variable "aws_region" {
  type        = string
  description = "The AWS Region"
}

variable "project" {
  type        = string
  description = "The Project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The TF component name"
  default     = "cdn"
}

# SPECIFIC

variable "dns_domain_name" {
  type        = string
  description = "The DNS domain name"
}