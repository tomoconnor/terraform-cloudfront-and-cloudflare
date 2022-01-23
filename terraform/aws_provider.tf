provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "useastone"
  region = "us-east-1"
}
