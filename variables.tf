variable "name" {
  description = "Name of the VPC"
}

variable "cidr" {
  description = "CIDR of the VPC"
}

variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "public_subnets" {
  description = "A list of public subnets to create"
  type        = "list"
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets to create"
  type        = "list"
  default     = []
}

variable "database_subnets" {
  description = "A list of private database subnets to create"
  type        = "list"
  default     = []
}

variable "azs" {
  description = "A list of Availability Zones in the region"
  type        = "list"
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "nat_gateway_count" {
  description = "Number of NAT Gateways to create (defaults to -1 to create one per public subnets)"
  default     = -1
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}
