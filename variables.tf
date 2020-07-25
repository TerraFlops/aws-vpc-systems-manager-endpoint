variable "vpc_id" {
  type = string
  description = "Id of the VPC where the endpoint will be created"
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
