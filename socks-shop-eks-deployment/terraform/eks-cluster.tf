module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = "vpc-020d4b507eb4c6b5c"
  subnet_ids               = module.jenkins-server-vpc.private_subnets

  eks_managed_node_groups = {
    one= {
      name = "master-node-group"

      instance_types = ["t2.medium"]
          
      min_size     = 1
      max_size     = 4
      desired_size = 2
    }

    two= {
      name = "worker-node-group"

      instance_types = ["t2.medium"]
          
      min_size     = 1
      max_size     = 4
      desired_size = 2
    }
  }
}

resource "aws_cloudwatch_log_group" "eks_cluster_logs" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7  // Adjust retention period as needed
}
