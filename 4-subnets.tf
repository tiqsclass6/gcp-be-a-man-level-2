resource "google_compute_subnetwork" "subnets" {
  for_each                 = { for subnet in var.subnets : subnet.name => subnet }
  name                     = each.value.name
  region                   = each.value.region
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = true
}