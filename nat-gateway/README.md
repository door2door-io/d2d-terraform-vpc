AWS VPC NAT Gateways terraform module
===========

A terraform module to create NAT Gateways an AWS VPC


Module Input Variables
----------------------

- `nat_gateway_count` - number of NAT Gateways to create
- `public_subnets` - list of public subnets IDs to create NAT Gateways in
- `tags` - dictionary of tags that will be added to resources created by the module


Usage
-----

```hcl
module "nat_gateways" {
  source = "./nat-gateway"

  nat_gateway_count = 2
  public_subnets    = ["${module.public_subnets.subnet_ids}"]
}
```

Outputs
=======

 - `nat_gateway_ips` - IP addresses of the NAT Gateways
 - `nat_gateway_ids` - IDs of the NAT Gateways
