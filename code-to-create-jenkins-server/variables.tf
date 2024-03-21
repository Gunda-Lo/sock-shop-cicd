variable "region" {
    description = "The region that will be used"
    default = "us-east-1"
}

variable "availability_zone" {
    description = "The availability zone that will be used"
    default = "us-east-1a"
}

variable "vpc_cidr_block" {
  
}

variable "subnet_cidr_block" {
  
}
 
 variable "aws_ami" {
    description = "The ami that will be used"
    default = "ami-07d9b9ddc6cd8dd30"
 }

 variable "instance_type" {
    description = "The instance type that will be used"
    default = "t2.medium"   
 }

 variable "env_prefix" {
    type        = string
  description = "Environment prefix (dev, prod, staging)"
  default     = "dev"
}


variable "volume_size" {
  
}