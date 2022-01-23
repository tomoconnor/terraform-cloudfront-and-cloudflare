output "cdn_domain_name" {
  value = aws_acm_certificate.cdn.domain_name
}
output "cdn_certificate_arn" {
  value = aws_acm_certificate.cdn.arn
}

output "cdn_oai_iam_arns" {
  value = module.cdn.cloudfront_origin_access_identity_iam_arns
}