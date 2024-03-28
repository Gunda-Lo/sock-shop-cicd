module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

 vpc_id     = var.existing_vpc_id  # Use the existing VPC ID
  subnet_ids = [
    module.eks-vpc.private_subnets.id,  # Reference the ID of the private subnet created above
    module.eks-vpc.public_subnets.id,   # Reference the ID of the public subnet created above
  ]

  eks_managed_node_groups = {
    one= {
      name = "master-node-group"

      instance_types = ["t2.medium"]
          
      min_size     = 1
      max_size     = 4
      desired_size = 2
      security_groups = [
        var.existing_sg_id,  # Specify the existing security group ID
      ]
    }

    two= {
      name = "worker-node-group"

      instance_types = ["t2.medium"]
          
      min_size     = 1
      max_size     = 4
      desired_size = 2
      security_groups = [
        var.existing_sg_id,  # Specify the existing security group ID
      ]
    }
  }
}

resource "aws_cloudwatch_log_group" "sock-shop" {
  name = "sock-shop"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}
