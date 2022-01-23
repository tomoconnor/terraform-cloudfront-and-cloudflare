data "cloudflare_zone" "primary" {
  name = var.dns_domain_name
}