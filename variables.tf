variable "vpc_id" {
  type = string
  description = "Id of the VPC where the endpoint will be created"
}

variable "name" {
  type = string
  description = "Optional name to tag the endpoint. If none supplied a name will be automatically generated based on the VPC name tag"
  default = null
}

variable "subnet_ids" {
  type = set(string)
  description = "IDs of subnets where endpoint will be exposed"
  default = null
}

variable "security_group_ids" {
  type = set(string)
  description = "IDs of security group(s) that will be applied to the endpoint"
  default = null
}

variable "private_dns_enabled" {
  type = bool
  description = "Boolean flag to enable private DNS"
  default = false
}
