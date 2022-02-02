data "aws_route53_zone" "r53_zone" {
  zone_id      = var.k53zoneid
  private_zone = false
}

data "aws_iam_policy_document" "quickcare_bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.quick_care_website_bucket.arn,
      "${aws_s3_bucket.quick_care_website_bucket.arn}/*",
    ]
  }
}
