# Create example VPC
module "vpc" {
  source = "git::https://github.com/TerraFlops/aws-vpc.git"
  name = "example"
  description = "Example VPC"

  cidr_block = "10.16.130.128/25"
  subnet_cidr_blocks = {
    public = [
      "10.16.130.128/26",
    ]
    compute = [
      "10.16.130.192/26"
    ]
  }
  availability_zones = [
    "ap-southeast-2a"
  ]

  # Create Internet Gateway
  internet_gateway_enabled = true
  internet_gateway_subnet_type = "public"

  # Enable NAT instance
  nat_instance_enabled = true
  nat_instance_security_group = "nat_instance"

  # Security groups
  security_groups = {
    lambda = "Lambda security group"
    nat_instance = "NAT instance security group"
  }
  append_vpc_description = true

  security_group_rules = {
    lambda = [
      { direction="inbound", entity_type="cidr_block", entity_id="anywhere", ports="all", protocol="all" },
      { direction="outbound", entity_type="cidr_block", entity_id="anywhere", ports="all", protocol="all" }
    ]
  }
}

# Create VPC endpoint
module "systems_manager_vpc_endpoint" {
  source = "git::https://github.com/TerraFlops/aws-vpc-systems-manager-endpoint.git"
  vpc_id = module.vpc.vpc_id
  security_group_ids = [
    module.vpc.security_group_ids["lambda"]
  ]
  subnet_ids = [
    module.vpc.subnet_ids["compute_subnet_2a"]
  ]
}
