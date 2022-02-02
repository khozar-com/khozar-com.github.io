variable "region" {
  type    = string
  default = "af-south-1"
}

variable "secretkey" {
  type = string
  default = "aws_secret_key"
}

variable "accesskey" {
  type = string
  default="aws_access_key"
}

variable "k53zoneid" {
  type = string
  default="route_53_zone_id"
}

variable "quickcare_bucket_name" {
  type = string
  default="quickcaresurgery.co.za"
}
