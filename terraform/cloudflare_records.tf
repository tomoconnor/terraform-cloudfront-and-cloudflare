resource "cloudflare_record" "domainvalidation" {
  for_each = {
    for dvo in aws_acm_certificate.cdn.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
      type  = dvo.resource_record_type
    }
  }
  zone_id         = data.cloudflare_zone.primary.id
  allow_overwrite = true
  name            = each.value.name
  value           = each.value.value
  type            = each.value.type
  ttl             = 300

}

resource "cloudflare_record" "cdn_cname" {
  zone_id         = data.cloudflare_zone.primary.id
  allow_overwrite = true
  name            = aws_acm_certificate.cdn.domain_name
  value           = module.cdn.cloudfront_distribution_domain_name
  type            = "CNAME"
  ttl             = 300
}