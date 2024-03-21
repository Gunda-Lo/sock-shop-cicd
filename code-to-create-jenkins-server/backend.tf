terraform {
  backend "s3" {
    bucket         = "socks-shop-deploy-eks"
    region         = var.region
    key            =  "jenkins-server/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
  }
}