resource "aws_launch_template" "app" {
  name_prefix   = "app-launch-template"
  image_id      = var.ami
  instance_type = "t2.micro"
  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    docker run -d -p 80:80 --name myapp -e AWS_ACCESS_KEY_ID=${var.aws_access_key_id} -e AWS_SECRET_ACCESS_KEY=${var.aws_secret_access_key} -e S3_BUCKET_NAME=${var.s3_bucket_name} -e AWS_REGION=${var.aws_region} nginx
  EOF
  )
}