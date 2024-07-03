terraform {
  backend "s3" {
    bucket         = "terraform-state-biggil"
    key            = "aula_backend"
    region         = "us-west-2"
    dynamodb_table = "descomplicando-terraform-turma-2024"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}