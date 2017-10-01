# Playground for AWS Lambda

[Basic article](https://seanmcgary.com/posts/how-to-deploy-an-aws-lambda-with-terraform)
[API, lambda, terraform](https://digitalronin.github.io/2017/06/12/terraform-aws-lambda.html)
[IAM - very good explanation](https://start.jcolemorrison.com/aws-iam-policies-in-a-nutshell/)

## Goal

1. Deploy node lambda, triggered by API gateway
1. Scrape a website
1. Post to DB

## Cool Tidbits

* Graph your terraform by running terraform graph.  DOT graph produced that can be easily visualized with online tools for example.
* Terraform variables can come from environment variables, put sensitive stuff like your keys in there, not in the repo ofcourse