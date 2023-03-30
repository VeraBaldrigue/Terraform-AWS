terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "bucket-vera-tfstate"
    key    = "S3"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}