# ablackcloudapp-infra

Terraform infrastructure for hosting the [ablackcloudapp](https://github.com/) React SPA on AWS (S3 + CloudFront).

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.5
- AWS CLI configured (`aws sts get-caller-identity`)
- IAM permissions for S3, CloudFront, and IAM

## Quick start

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

## Importing existing resources

If `ablackcloudapp.com` and CloudFront distribution `E2Y30RJOE2VRP4` already exist in AWS, import them instead of creating new ones:

```bash
cd terraform
terraform init

terraform import aws_s3_bucket.site ablackcloudapp.com
terraform import aws_cloudfront_distribution.site E2Y30RJOE2VRP4

terraform plan
```

Review the plan carefully — Terraform may want to align settings (OAC, bucket policy, public access block) with this configuration.

## Remote state (recommended for teams / CI)

```bash
cd terraform/bootstrap
terraform init && terraform apply
cd ..
# Uncomment the backend block in versions.tf, then:
terraform init -migrate-state
```

## Outputs for the app repo

After apply, use these in GitHub Actions or deploy scripts:

```bash
cd terraform
terraform output site_bucket_name
terraform output cloudfront_distribution_id
terraform output cloudfront_domain_name
terraform output deploy_policy_arn
```

Attach `deploy_policy_arn` to your CI role or IAM user.

## Layout

```
.
├── README.md
└── terraform/
    ├── bootstrap/          # One-time S3 + DynamoDB for remote state
    ├── cloudfront.tf
    ├── iam.tf
    ├── outputs.tf
    ├── provider.tf
    ├── s3.tf
    ├── variables.tf
    ├── versions.tf
    └── terraform.tfvars.example
```
