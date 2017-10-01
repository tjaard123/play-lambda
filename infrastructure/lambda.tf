resource "aws_lambda_function" "scraper" {
  function_name    = "scraper"
  handler          = "index.handler"
  runtime          = "nodejs4.3"
  filename         = "function.zip"
  source_code_hash = "${base64sha256(file("function.zip"))}"
  role             = "${aws_iam_role.lambda_exec_role.arn}"
}
