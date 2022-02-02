provider "aws" {
  region     = var.region
  access_key = var.accesskey
  secret_key = var.secretkey
}

provider "aws" {
   region = "us-east-1"
   alias = "us-east-1"
}
