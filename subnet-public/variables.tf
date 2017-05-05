variable "vpc_id" {
  description = "Create the public subnets in this VPC"
}

variable "vpc_name" {
  description = "VPC name to use in resource names interpolations"
}

variable "subnets" {
  description = "A list of public subnets to create"
  type        = "list"
}

variable "azs" {
  description = "A list of Availability Zones in the region"
  type        = "list"
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"
  default     = {}
}
