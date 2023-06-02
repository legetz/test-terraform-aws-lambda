# test-terraform-aws-lambda

- Lambda function written in Python
- Deployment is done with Terraform and terraform-aws-lambda module

# Deployment to dev with Terraform
- Change `your-terraform-state-bucket` to correct one at `terraform/dev/backend.tf`
- `./deploy.sh dev`
