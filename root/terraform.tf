terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }

  backend "s3" {

    bucket = "zoomclone-terrafrom-bucket"
    region = "us-east-1"
    key    = "Terra-Zoom-Backend"
  }
}