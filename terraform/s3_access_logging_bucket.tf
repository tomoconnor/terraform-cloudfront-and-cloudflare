module "s3_bucket_for_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${local.aws_global_level_id}-s3-access-logs"
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy                         = false
  block_public_acls                     = true
  block_public_policy                   = true
  attach_deny_insecure_transport_policy = true

}