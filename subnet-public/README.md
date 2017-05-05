AWS public VPC subnets terraform module
===========

A terraform module to create public subnets in an AWS VPC


Module Input Variables
----------------------

- `vpc_id` - VPC ID to create the public subnets in
- `subnets` - list of public subnet cidrs
- `azs` - list of AZs in which to distribute subnets
- `map_public_ip_on_launch` - auto-assign public IP on launch (defaults to _true_)
- `tags` - dictionary of tags that will be added to resources created by the module


Usage
-----

```hcl
module "public_subnets" {
  source = "./subnet-public"

  vpc_id    = "${aws_vpc.current.id}"
  vpc_name  = "vpc-name"
  subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  azs       = ["eu-central-1a", "eu-central-1b"]
}
```

Outputs
=======

 - `subnet_ids` - list of public subnet ids
 - `route_table_ids` - list of public route table ids
 - `igw_id` - Internet Gateway id string
