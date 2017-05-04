AWS VPC terraform module
===========

A Terraform module to create an AWS VPC supporting public, private and database subnets plus NAT Gateways


Module Input Variables
----------------------

- `name` - name for the VPC
- `cidr` - network block in CIDR notation
- `public_subnets` - list of public subnet CIDRs (defaults to empty)
- `private_subnets` - list of private subnet CIDRs (defaults to empty)
- `database_subnets` - list of private database subnet CIDRs (defaults to empty)
- `azs` - list of AZs in which to distribute subnets
- `nat_gateway_count` - number of NAT Gateways to create (defaults to _-1_)
- `enable_dns_hostnames` - use private DNS (defaults to _true_)
- `enable_dns_support` - use private DNS (defaults to _true_)
- `map_public_ip_on_launch` - auto-assign public IP on launch (defaults to _true_)
- `tags` - dictionary of tags that will be added to resources created by the module


NAT Gateways
------------

| nat_gateway_count | result |
| -----------------:|--------|
| -1 (default)      | create one per public subnet |
| 0                 | do not create any |
| >= 1              | create this many |


Usage
=====

1-tier with only private subnets
-------------------------------

```hcl
module "vpc" {
  source = "github.com/door2door-io/d2d-terraform-vpc?ref=v0.0.1"

  name            = "vpc-name"
  cidr            = "10.0.0.0/16"
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["eu-central-1a", "eu-central-1b"]

  tags {
    "Terraform" = "true"
    "Environment" = "test"
  }
}
```

2-tier with public and private subnets + 1 shared NAT Gateway
-------------------------------------------------------------

```hcl
module "vpc" {
  source = "github.com/door2door-io/d2d-terraform-vpc?ref=v0.0.1"

  name              = "vpc-name"
  cidr              = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  azs               = ["eu-central-1a", "eu-central-1b"]
  nat_gateway_count = 1

  tags {
    "Terraform" = "true"
    "Environment" = "test"
  }
}
```

3-tier with public, private and database subnets + NAT Gateways
---------------------------------------------------------------

```hcl
module "vpc" {
  source = "github.com/door2door-io/d2d-terraform-vpc?ref=v0.0.1"

  name              = "vpc-name"
  cidr              = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets  = ["10.0.201.0/24", "10.0.202.0/24"]
  azs               = ["eu-central-1a", "eu-central-1b"]
  nat_gateway_count = -1

  tags {
    "Terraform" = "true"
    "Environment" = "test"
  }
}
```


Outputs
=======

 - `vpc_id` - ID of the VPC
 - `public_subnet_ids` - list of public subnet IDs
 - `public_route_table_ids` - list of public route table IDs
 - `private_subnet_ids` - list of private subnet IDs
 - `private_route_table_ids` - list of private route table IDs
 - `database_subnet_ids` - list of private database subnet IDs
 - `database_route_table_ids` - list of private database route table IDs
 - `database_subnet_group` - database subnet group name
 - `nat_gateway_ips` - list of NAT Gateways public IP addresses
