# resource "aws_route53_zone" "primary" {
#   name = var.quickcare_bucket_name
# }
#
# resource "aws_route53_record" "name_server" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = var.quickcare_bucket_name
#   type    = "NS"
#   ttl     = "30"
#   records = var.name_servers
# }
