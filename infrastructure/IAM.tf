resource "aws_iam_role" "lambda_exec_role" {
  name        = "lambda_exec_role"
  description = "Role used to execute Lambda functions"

  assume_role_policy = <<EOF
{  
   "Version":"2012-10-17",
   "Statement":[  
      {  
         "Action":"sts:AssumeRole",
         "Principal":{  
            "Service":"lambda.amazonaws.com"
         },
         "Effect":"Allow",
         "Sid":""
      }
   ]
}
EOF
}

resource "aws_iam_policy" "cloudwatch_log_policy" {
  name        = "cloudwatch_log_policy"
  description = "Policy to log to cloudwatch"

  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Action":[
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
         ],
         "Effect":"Allow",
         "Resource":"arn:aws:logs:eu-west-1:*"
      }
   ]
}
EOF
}

# Attach role to custom created policy
resource "aws_iam_role_policy_attachment" "log_lambda_attachment" {
  role       = "${aws_iam_role.lambda_exec_role.name}"
  policy_arn = "${aws_iam_policy.cloudwatch_log_policy.arn}"
}
