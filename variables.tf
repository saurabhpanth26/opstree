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
  default     = "sample-project-bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
  type        = string
}

variable "route53_zone_id" {
  description = "Route 53 Zone ID"
  default     = "" # need to add
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  default     = "" #need to add
  type        = string
}

variable "ami" {
  description = "ami id of amazon linux"
  default     = "" #need to add
  type        = string
}
