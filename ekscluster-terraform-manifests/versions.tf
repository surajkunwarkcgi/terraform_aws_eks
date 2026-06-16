#Terraform Settings Block
terraform {
  required_version = ">=1.15.6"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.31"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks-suraj"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "ap-northeast-1"
    use_lockfile = true
  }
}

#Terraform Provider Block
provider "aws" {
    region = var.aws_region
}