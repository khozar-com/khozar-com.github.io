QuickCare IAC

This creates the infrastructure highlighted in the QuickCare Architecture.pdf

The IAC is written in Terraform to automatically provision and deploy the necessary resources
required for this site to function.

- Managed Services

Route53 A records
CloudFront
ACM certificate creation and verification
S3 bucket creation and website upload

- Things to consider when running.

Version -> This works with AWS provider version 3.74.0 and Terraform version 1.1.3,
therefore if you are having issue kindly consider installing those versions.

- Setup

1) Install terraform https://learn.hashicorp.com/tutorials/terraform/install-cli

2) Create a terraform.tfvars and set the below (only change access and secretkey):
region = "af-south-1"
accesskey = "access_key_value"
secretkey = "secret_key_value"
k53zoneid = "Z006069217O77YHZ1BZO6"
quickcare_bucket_name = "quickcaresurgery.co.za"

3) Run terraform init

4) Run terraform apply


- For the future

Ansible -> Implement Ansible for S3 uploading to decouple infrastructure provisioning and configuration
management
