terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }

  backend "s3" {
    region  = "eu-west-1"
    encrypt = "true"
  }

  required_version = "~> 1.4.6"
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.18.0"
}

provider "aws" {
  region      = "eu-west-1"
  max_retries = 1
  default_tags {
    tags = {
      environment = var.environment
      application = local.name
      author      = local.author
    }
  }

  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

locals {
  name           = "test-terraform-aws-lambda"
  author         = "Leo Jokinen"
}

variable "environment" {
  type    = string
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda_function.lambda_function_name
}