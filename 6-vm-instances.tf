resource "google_compute_instance" "vm_instances" {
  for_each     = { for subnet in var.subnets : subnet.name => subnet }
  name         = "${each.value.name}-vm"
  machine_type = "e2-medium"
  zone         = "${each.value.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnets[each.key].self_link
  }

  tags = ["iap-ssh", "allow-icmp"]

  metadata_startup_script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y apache2
      systemctl start apache2
      systemctl enable apache2
    EOT
}