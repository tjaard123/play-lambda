variable "region" {
  default = "eu-west-1"
}

variable "accountId" {
  default = "<ACCOUNT ID>"
}

provider "aws" {
  region = "eu-west-1"
}
