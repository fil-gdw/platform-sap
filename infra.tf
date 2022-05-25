resource "aws_iam_role" "iam_for_lambda" {
name ="iam_for_lambda"
assume_role_policy = << EOF
  {
  "Version": "2012-10-17",
  "Statement" ; [
    {
      "Action": "sts:AssumeRole",
      "Principla": { "Service": "lambda.amazonaws.com"
          },
      "Effect" : "Allow"
    }]
  }
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename = "lambda_function_tet.zip"
  function_name = "lambda_function_name"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "index.test"
  source_code_hash = filebase64sha256("lambda_function_new.zip")
  runtime = "nodejs12.x"
  environment {
  variables = {
  foo = "bar"
  }
  }
}
