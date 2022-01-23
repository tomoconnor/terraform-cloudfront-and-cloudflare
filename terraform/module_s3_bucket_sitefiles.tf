data "aws_iam_policy_document" "oai_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${local.aws_global_level_id}-storage-files/*"]
    principals {
      type        = "AWS"
      identifiers = module.cdn.cloudfront_origin_access_identity_iam_arns
    }
  }
}

module "s3_bucket_for_sitefiles" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${local.aws_global_level_id}-storage-files"
  acl    = "private"

  attach_policy = true
  policy        = data.aws_iam_policy_document.oai_policy.json

  force_destroy                         = false
  block_public_acls                     = true
  block_public_policy                   = true
  ignore_public_acls                    = true
  restrict_public_buckets               = true
  attach_deny_insecure_transport_policy = true
  versioning = {
    enabled = true
  }

  logging = {
    target_bucket = module.s3_bucket_for_logs.s3_bucket_id
    target_prefix = "storage-files/"
  }

}
