resource "cloudflare_zone" "main" {
  account_id = data.cloudflare_accounts.main.id
  zone       = var.zone
}

resource "cloudflare_record" "main" {
  for_each = { for record in local.dns_records : record.name => record }

  zone_id = cloudflare_zone.main.id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl

  dynamic "data" {
    for_each = each.value.data
    content {
      service  = data.value.service
      proto    = data.value.proto
      name     = data.value.name
      port     = data.value.port
      priority = data.value.priority
      target   = data.value.target
      weight   = data.value.weight
    }
  }
}
