resource "google_compute_firewall" "allow_internal_icmp" {
  name    = "allow-internal-icmp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  source_ranges = [for subnet in var.subnets : subnet.ip_cidr_range]

  target_tags = ["allow-icmp"]
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.vpc.name

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["iap-ssh"]
}