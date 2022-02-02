resource "aws_route53_record" "route53_quickcare_record" {
  zone_id = var.k53zoneid
  name    = var.quickcare_bucket_name
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "route53_wwwquickcare_record" {
  zone_id = var.k53zoneid
  name    = "www.${var.quickcare_bucket_name}"
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
