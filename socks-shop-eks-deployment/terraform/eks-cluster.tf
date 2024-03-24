module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true


  vpc_id                   = "vpc-06a057e557b4a6f9f"
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