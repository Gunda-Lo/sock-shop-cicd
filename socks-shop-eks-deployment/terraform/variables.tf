variable "private_subnets_cidr_blocks" {}
variable "public_subnets_cidr_blocks" {}
variable "vpc_cidr_block" {}
variable "cluster_name" {}
variable "region" {
    description = "EKS cluster region"
    type = string
    default = "us-east-1"
  }