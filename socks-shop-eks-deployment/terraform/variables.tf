variable "private_subnets_cidr_blocks" {
  type    = list(string)
  default = ["100.0.1.0/24", "100.0.2.0/24", "100.0.3.0/24"]
}

variable "public_subnets_cidr_blocks" {
  type    = list(string)
  default = ["100.0.101.0/24", "100.0.102.0/24", "100.0.103.0/24"]
}

variable "vpc_cidr_block" {
  type    = string
  default = "100.0.0.0/16"
}

variable "cluster_name" {
  type    = string
  default = "sock-shop-eks-cluster"
}

variable "region" {
  description = "EKS cluster region"
  type        = string
  default     = "us-east-1"
}