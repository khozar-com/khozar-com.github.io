resource "aws_s3_bucket" "quick_care_website_bucket" {
  bucket = var.quickcare_bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  force_destroy = "true"

  #This is temporary and will be replaced with Ansible
  #Local code needs to be run with aws cli being configured
  provisioner "local-exec" {
    command = "aws s3 cp ../ s3://${aws_s3_bucket.quick_care_website_bucket.id} --recursive --exclude 'terraform/*' --exclude '.git/*' --exclude '.gitignore' --exclude '.DS_Store'"
    environment = {
      AWS_DEFAULT_REGION= var.region
      AWS_ACCESS_KEY_ID = var.accesskey
      AWS_SECRET_ACCESS_KEY = var.secretkey
    }
  }
}
