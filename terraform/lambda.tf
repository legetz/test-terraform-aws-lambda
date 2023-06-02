module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name                     = "${local.name}-${var.environment}"
  handler                           = "main.handler"
  architectures                     = ["arm64"]
  runtime                           = "python3.9"
  source_path                       = "../src"
  timeout                           = 10
  memory_size                       = 128
  reserved_concurrent_executions    = -1
  
  environment_variables = {
    ENV                     = var.environment
    POWERTOOLS_SERVICE_NAME = "${local.name}-${var.environment}"
    LOG_LEVEL               = "INFO"
  }
}