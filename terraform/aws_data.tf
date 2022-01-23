data "aws_caller_identity" "current" {}
data "aws_canonical_user_id" "current" {}
data "aws_cloudfront_log_delivery_canonical_user_id" "current" {}

data "aws_cloudfront_origin_request_policy" "managed_cors_s3" {
  name = "Managed-CORS-S3Origin"
}

data "aws_cloudfront_cache_policy" "managed_cache_optimized" {
  name = "Managed-CachingOptimized"
}