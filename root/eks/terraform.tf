terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = "5.71.0"
    }

    helm = {

      source  = "hashicorp/helm"
      version = "2.16.0"
    }
  }


  backend "s3" {

    bucket = "zoomclone-eks-bucket"
    region = "us-east-1"
    key    = "Terra-Zoom-Backend"
  }
}