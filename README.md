# terraform-aws-s3

Private registry module that provisions a secure, opinionated AWS S3 bucket with versioning, server-side encryption, public access blocking, and optional lifecycle rules.

This module is intentionally designed to work with the `security-baseline` policy set — the `enable_versioning` variable must be `true` for policy checks to pass.

## Usage

```hcl
module "app_bucket" {
  source  = "app.terraform.io/vishnu-test-org/s3/aws"
  version = "1.0.0"

  bucket_name = "my-app-assets-prod"
  environment = "production"

  enable_versioning = true   # required by security-baseline policy
  enable_lifecycle  = true
}
```

## Demo Note: Trigger a Policy Failure

Set `enable_versioning = false` to demonstrate the `require-s3-versioning` Sentinel policy blocking a plan:

```hcl
enable_versioning = false  # This will cause the security-baseline policy to FAIL
```

## Resources Created

- `aws_s3_bucket`
- `aws_s3_bucket_versioning`
- `aws_s3_bucket_server_side_encryption_configuration`
- `aws_s3_bucket_public_access_block`
- `aws_s3_bucket_lifecycle_configuration` (optional)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | Globally unique bucket name | string | — | yes |
| environment | Environment name | string | — | yes |
| enable_versioning | Enable S3 versioning | bool | true | no |
| enable_lifecycle | Enable lifecycle rules | bool | true | no |
| noncurrent_version_retention_days | Days to keep old versions | number | 30 | no |
| tags | Additional tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | Bucket name |
| bucket_arn | Bucket ARN |
| bucket_regional_domain_name | Regional domain name |
| versioning_status | Current versioning status |
