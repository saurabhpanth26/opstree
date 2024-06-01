variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "ami" {
  description = "ami of aws image"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
  type        = string
}
