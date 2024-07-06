locals {
  cloudflare_kv_secret_name = "cloudflare-terraform"

  dns_records = {
    for dns_record in yamldecode(file("${path.module}/_configuration/dns.yaml")).dns_records : dns_record.name => dns_record...
  }
}
