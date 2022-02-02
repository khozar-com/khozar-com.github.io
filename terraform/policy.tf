resource "aws_s3_bucket_policy" "quickcare_bucket_policy_link" {
  bucket = aws_s3_bucket.quick_care_website_bucket.id
  policy = data.aws_iam_policy_document.quickcare_bucket_policy.json
}
