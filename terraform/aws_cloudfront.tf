module "cdn" {
  source              = "terraform-aws-modules/cloudfront/aws"
  aliases             = [aws_acm_certificate.cdn.domain_name]
  comment             = "CDN for Blog Post Data"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"  #cheapest price class.
  retain_on_delete    = false
  wait_for_deployment = false #this is important, and means we don't have to sit and wait for the CDN to be finished deploying.

  create_origin_access_identity = true
  origin_access_identities = {
    sitefiles = "${local.aws_global_level_id}-storage-files"
    # If this is set to a full lookup from the module, it'll cause a Cycle.
  }

  logging_config = {
    bucket = module.log_bucket.s3_bucket_bucket_domain_name
    prefix = "cloudfront"
  }
  
  origin = {
    sitefiles = {
      domain_name = module.s3_bucket_for_sitefiles.s3_bucket_bucket_domain_name
      s3_origin_config = {
        origin_access_identity = "files"
      }
    }
  }
  viewer_certificate = {
    acm_certificate_arn      = aws_acm_certificate.cdn.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
  default_cache_behavior = {
    target_origin_id       = "files"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods          = ["GET", "HEAD", "OPTIONS"]
    cached_methods           = ["GET", "HEAD"]
    compress                 = true
    query_string             = true
    use_forwarded_values     = false
    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.managed_cors_s3.id
    cache_policy_id          = data.aws_cloudfront_cache_policy.managed_cache_optimized.id

  }
}


