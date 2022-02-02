provider "aws" {
  region = var.region
  access_key = var.accesskey
  secret_key = var.secretkey
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
