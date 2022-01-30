resource "aws_s3_bucket" "quick_care_website_bucket" {
  bucket = "quickcaresurgery.co.za"
  acl    = "public-read"
  policy = file("./policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "QuickCare Website"
    Environment = "PRODUCTION"
  }

}

output "s3domainname" {
  value = aws_s3_bucket.quick_care_website_bucket.bucket_domain_name
}
