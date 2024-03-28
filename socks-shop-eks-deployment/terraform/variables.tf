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

variable "existing_vpc_id" {
  description = "References an exiting vpc"
  type = string
  default = "vpc-0939c4e059375b1bd"
  }

  variable "existing_sg_id" {
    description = "Refrences an existing security group"
    type = string
    default = "sg-0483ba65a162268a3"
  }