# Terraform AWS Deployment

This repository contains Terraform scripts to deploy a Dockerized web application on AWS with the following features:
- S3 bucket for file storage
- CloudFront CDN for performance
- Auto-scaling for handling varying workloads
- Route 53 for domain management

## Structure
- `main.tf`: Main configuration file to deploy resources.
- `provider.tf`: AWS provider configuration.
- `variables.tf`: Variable definitions.
- `modules/`: Directory containing Terraform modules for each resource.

## Setup Instructions

1. **Clone the repository**:
    ```sh
    git clone <repository_url>
    cd <repository_name>
    ```

2. **Set up environment variables**:
    Ensure you have your AWS credentials set up as environment variables:
    ```sh
    export AWS_ACCESS_KEY_ID=<your_access_key_id>
    export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
    ```

3. **Initialize and apply Terraform**:
    ```sh
    terraform init
    terraform apply
    ```

## Parameters
- `aws_region`: The AWS region to deploy the resources (default: us-west-2).
- `route53_zone_id`: Route 53 hosted zone ID.
- `domain_name`: The domain name for the application.

## Notes
- Ensure your IAM user has the necessary permissions for the resources being created.
- The Docker image used in this example is `nginx`. Modify the `user_data` script in the EC2 module if using a different image.

## Outputs
- `s3_bucket_name`: Name of the created S3 bucket.
- `cloudfront_domain_name`: CloudFront distribution domain name.
- `autoscaling_group_name`: Name of the auto-scaling group.
