# Playground for AWS Lambda

[Basic article](https://seanmcgary.com/posts/how-to-deploy-an-aws-lambda-with-terraform)

[API, lambda, terraform](https://digitalronin.github.io/2017/06/12/terraform-aws-lambda.html)

[From Terraform](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html)

[IAM - very good explanation](https://start.jcolemorrison.com/aws-iam-policies-in-a-nutshell/)

## Goal

1. Deploy node lambda, triggered by API gateway
1. Scrape a website
1. Post to DB

## Cool Tidbits

* Graph your terraform by running terraform graph.  DOT graph produced that can be easily visualized with online tools for example.
* Terraform variables can come from environment variables, put sensitive stuff like your keys in there, not in the repo ofcourse.  You can then specify a profile to run as before doing terraform command, for example AWS_Tjaard terraform apply.  You don't even need to specify credential variables in terraform code.

## AWS CLI config files demystified by example

AWS CLI files are located at `<user>/.aws`

Config file
```sh
[default]
output = json
region = eu-west-1
```

Credentials file (No real keys here of course):
```sh
## Your personal account
[default]
aws_access_key_id = XTTTIXXXX7WTTXXEXXXA
aws_secret_access_key = +OMXxJGx3xx8pXuQxxxxAVxx58XXp7xxxXxxXXe

## Company account
## --------------------------------------------------------------------------

[company]
aws_access_key_id: ZTTTIZZZZ7WTTZZEZZZA
aws_secret_access_key: +OMXzJGz3zz8pXuQzzzzAVzz58XXp7zzzXzzXXe

## Connect with Company account and assume role to another account

[client-at-company]
role_arn=arn:aws:iam::111175111141:role/OrganizationAccountAccessRole
source_profile=company # Links back to company profile
```

You can use the CLI like this now:
```sh
aws s3 ls # Outputs S3 buckets for default (personal) account in eu-west-1
aws s3 ls --profile company # Company root account in eu-west-1
aws s3 ls --pfofile client-at-company # Assume role through company root account to client account 111175111141 and list S3 buckets in eu-west-1
```