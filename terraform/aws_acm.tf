resource "aws_acm_certificate" "cdn" {
  provider          = aws.useastone
  domain_name       = join(".", ["cdn", var.dns_domain_name])
  validation_method = "DNS"
  tags = {
    Name = "cdn-useast-1-acm-certificate"
  }

  lifecycle {
    create_before_destroy = true
  }

}

