# terraform-cloudfront-and-cloudflare

`CLOUDFLARE_API_TOKEN` needs to be set in the environment variables for Cloudflare auth. 

I use `awsume` to set AWS access/secret keys and do the whole `sts:AssumeRole` thing.  Other tools are available.

You need to provide a `.tfvars` file to set the following variables:
* `aws_region`
* `project`
* `environment`
* `dns_domain_name`


TFSec Output:
-------------
```
  times
  ------------------------------------------
  disk i/o             2.353141ms
  parsing HCL          35.412µs
  evaluating values    731.8µs
  running checks       2.953182ms

  counts
  ------------------------------------------
  files loaded         13
  blocks               27
  modules              0

  results
  ------------------------------------------
  critical             0
  high                 0
  medium               0
  low                  0
  ignored              0

No problems detected!
```