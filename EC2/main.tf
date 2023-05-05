terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  #backend "s3" {
  #   bucket = "bucket-tfstate-vera"
  #   key    = "${var.env}/EC2-tfstate/EC2-terraform.tfstate" não pode ???
  #   region = "us-east-1"
  #  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "currentuser" {}