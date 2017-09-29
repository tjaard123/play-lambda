resource "aws_lambda_function" "demo_lambda" {
  function_name    = "demo_lambda"
  handler          = "index.handler"
  runtime          = "nodejs4.3"
  filename         = "function.zip"
  source_code_hash = "${base64sha256(file("function.zip"))}"
  role             = "${aws_iam_role.lambda_exec_role.arn}"
}
