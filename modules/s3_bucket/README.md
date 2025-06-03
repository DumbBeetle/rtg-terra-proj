# S3 Bucket

Creates an S3 bucket for storage of tfstate files.

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |
| Random    | 3.7.2     |

## Inputs

| Name        | Description    | Type   | Default | Required |
|-------------|----------------|--------|---------|:--------:|
| bucket_name | S3 bucket name | string |         |   yes    |

## Outputs

| Name          | Description              | Type   | Default | Required |
|---------------|--------------------------|--------|---------|:--------:|
| s3_bucket_arn | s3 bucket arn identifier | string |         |   yes    |

## Usage

```hcl
module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}
```