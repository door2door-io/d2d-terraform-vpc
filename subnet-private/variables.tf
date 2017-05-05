variable "name" {
  description = "Subnet name to use in resource names interpolations"
  default     = "private"
}

variable "vpc_id" {
  description = "Create the private subnets in this VPC"
}

variable "vpc_name" {
  description = "VPC name to use in resource names interpolations"
}

variable "subnets" {
  description = "A list of private subnets to create"
  type        = "list"
}

variable "azs" {
  description = "A list of Availability Zones in the region"
  type        = "list"
}

variable "enable_nat" {
  description = "Create default routes using NAT Gateways from 'nat_gateways'"
  default     = false
}

variable "nat_gateways" {
  description = "A list of IDs of NAT Gateways to use as default routes"
  type        = "list"
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}
