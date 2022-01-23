# terraform-cloudfront-and-cloudflare

`CLOUDFLARE_API_TOKEN` needs to be set in the environment variables for Cloudflare auth. 

I use `awsume` to set AWS access/secret keys and do the whole `sts:AssumeRole` thing.  Other tools are available.

You need to provide a `.tfvars` file to set the following variables:
* `aws_region`
* `project`
* `environment`
* `dns_domain_name`
