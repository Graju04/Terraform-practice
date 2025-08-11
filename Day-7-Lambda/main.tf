#Lambda function
resource "aws_lambda_function" "name" {
    function_name = "my_lambda_function"
    role = aws_iam_role.lambda_role.arn
    handler = "lambda_function.lambda_handler"
    runtime = "python3.12"
    timeout = 10
    memory_size = 128

    filename = "lambda_function.zip"  #Ensure this file exists
    source_code_hash = filebase64sha256("lambda_function.zip")
  
}