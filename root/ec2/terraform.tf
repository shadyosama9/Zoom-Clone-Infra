terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = "5.71.0"
    }

  }


  backend "s3" {

    bucket = "zoomclone-ec2-bucket"
    region = "us-east-1"
    key    = "Terra-Zoom-Backend"
  }
}