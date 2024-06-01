module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "sample-project-bucket"
}

module "ec2" {
  source              = "./modules/ec2"
  ami = var.ami
  aws_access_key_id   = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  s3_bucket_name      = module.s3.bucket_name
  aws_region          = var.aws_region
}

module "cloudfront" {
  source    = "./modules/cloudfront"
  s3_bucket = module.s3.bucket_name
}

module "autoscaling" {
  source           = "./modules/autoscaling"
  launch_template_id = module.ec2.launch_template_id
  aws_access_key_id = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  s3_bucket_name = var.s3_bucket_name
}

## Route 53 ###

resource "aws_route53_record" "www" {
  zone_id = var.route53_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.cloudfront.cloudfront_domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
