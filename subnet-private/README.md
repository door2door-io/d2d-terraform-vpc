AWS private VPC subnets terraform module
===========

A terraform module to create private subnets in an AWS VPC


Module Input Variables
----------------------

- `name` - Subnet name to interpolate in resource names (defaults to 'private')
- `vpc_id` - VPC ID to create the private subnets in
- `vpc_name` - VPC name to interpolate in resource names
- `subnets` - list of private subnet CIDRs
- `azs` - list of AZs in which to distribute subnets
- `enable_nat` - create default routes using NAT Gateways from `nat_gateways`
- `nat_gateways` - list of NAT Gateways IDs to use as default routes
- `tags` - dictionary of tags that will be added to resources created by the module


Usage
-----

```hcl
module "private_subnets" {
  source = "./subnet-private"

  vpc_id       = "${aws_vpc.current.id}"
  vpc_name     = "vpc-name"
  subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  azs          = ["eu-central-1a", "eu-central-1b"]
  enable_nat   = true
  nat_gateways = ["${aws_nat_gateway.natgw.*.id}"]
}
```

Outputs
=======

 - `subnet_ids` - list of private subnet IDs
 - `route_table_ids` - list of private route table IDs
