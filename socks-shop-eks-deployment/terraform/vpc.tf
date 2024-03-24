data "aws_availability_zones" "azs" {}

module "eks-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"
  name = "eks-vpc"
  cidr = var.vpc_cidr_block
  private_subnets = var.private_subnets_cidr_blocks
  public_subnets = var.public_subnets_cidr_blocks
  azs             = data.aws_availability_zones.azs.names
  
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  
  tags = {
     "kubernetes.io/cluster/var.cluster_name" = "shared"
  }
  
  public_subnet_tags = {
    "kubernetes.io/cluster/var.cluster_name" = "shared"
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/var.cluster_name" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
  

}
resource "aws_security_group" "eks-sg" {
  vpc_id      = module.eks-vpc.id
  description = "Allowing Jenkins, Sonarqube, SSH Access"

  ingress = [
    for port in [22, 8080, 9000, 9090, 80] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      ipv6_cidr_blocks = ["::/0"]
      self             = false
      prefix_list_ids  = []
      security_groups  = []
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = ""
  }
}