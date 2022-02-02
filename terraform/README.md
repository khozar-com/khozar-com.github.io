QuickCare IAC

This creates the infrastructure highlighted in the QuickCare Architecture.pdf

The IAC is written in Terraform to automatically provision and deploy the necessary resources
required for this site to function.

Managed Services

- Route53 A records
- CloudFront
- ACM certificate creation and verification
- S3 bucket creation and website upload

Things to consider when running.

- Version -> This works with AWS provider version 3.74.0 and Terraform version 1.1.3,
therefore if you are having issue kindly consider installing those versions.

- Setup -> Currently you will have to do a local aws configure of your AWS credentials but this will
be resolved using environment variables in future.


Still To Do

- Ansible -> Implement Ansible for S3 uploading to decouple infrastructure provisioning and configuration
management

- Backend State Management -> Create a S3 backend for the tfstate file this enhances security
