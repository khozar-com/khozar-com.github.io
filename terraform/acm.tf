resource "aws_acm_certificate" "acm_certificate" {
  provider = aws.us-east-1
  domain_name       = "quickcaresurgery.co.za"
  validation_method = "DNS"
  subject_alternative_names = ["www.quickcaresurgery.co.za"]
}


resource "aws_route53_record" "r53_record" {
  depends_on = [
    aws_acm_certificate.acm_certificate,
  ]

  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.r53_zone.zone_id
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  provider = aws.us-east-1
  certificate_arn         = aws_acm_certificate.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.r53_record : record.fqdn]
}
