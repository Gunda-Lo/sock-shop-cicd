output "cluster_name" {
    description = "The AWS EKS cluster name"
    value = module.eks.cluster_name
}
  
output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value = module.eks.cluster_endpoint
}

output "region" {
    description = "AWS region"
  value = var.region
}

output "cluster_security_group_id" {
    description = "EKS cluster security group id"
    value = module.eks.cluster_security_group_id
}

output "private_subnets_id" {
  description = "Eks cluster private subnets id"
  value = module.eks-vpc.private_subnets_id
 }

 output "private_subnets_id" {
  description = "Eks cluster prpublicivate subnets id"
  value = module.eks-vpc.public_subnets_id
 }