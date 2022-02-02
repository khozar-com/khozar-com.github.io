variable "region" {
  type = string
  default = "af-south-1"
}

variable "secretkey" {
  type = string
}

variable "accesskey" {
  type = string
}

variable "k53zoneid" {
  type = string
}

variable "quickcare_bucket_name" {
  type = string
}

variable "name_servers" {
  type = list(string)
}
