resource "aws_lambda_function" "scraper" {
  function_name    = "scraper"
  handler          = "index.handler"
  runtime          = "nodejs6.10"
  filename         = "lambda/scraper.zip"
  source_code_hash = "${base64sha256(file("lambda/scraper.zip"))}"
  role             = "${aws_iam_role.lambda_exec_role.arn}"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.scraper.arn}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.accountId}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}
