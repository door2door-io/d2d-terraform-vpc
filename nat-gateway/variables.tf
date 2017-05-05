variable "nat_gateway_count" {
  description = "Number of NAT Gateways to create"
}

variable "public_subnets" {
  description = "A list of public subnets IDs to create NAT Gateways in"
  type = "list"
}
