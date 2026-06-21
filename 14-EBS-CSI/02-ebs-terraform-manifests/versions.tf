# Terraform Settings Block
terraform {
  required_version = ">= 1.15.6"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.31"
    }

    helm  = {
        source = "hashicorp/helm"
        version = "~> 3.2"
    }

    http = {
        source  = "hashicorp/http"
        version = "~> 3.6"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-eks-suraj"
    key = "dev/ebs-storage/terraform.tfstate"
    use_lockfile = true
    region = "ap-northeast-1"
  }
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}

# Terraform HTTP Provider Block
provider "http" {
  
}