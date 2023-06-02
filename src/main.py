from aws_lambda_powertools import Logger
from aws_lambda_powertools.utilities.typing import LambdaContext

logger = Logger()

def handler(event: dict, context: LambdaContext):
    logger.info("Handler invoked")
    
    return {
        'statusCode': 200,
        'message': 'test'
    }
        