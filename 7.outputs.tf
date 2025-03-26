output "vm_instance_ips" {
  value       = { for instance in google_compute_instance.vm_instances : instance.name => instance.network_interface[0].network_ip }
  description = "Internal IPs of the created VM instances"
} # output "vm_instance_ips" for the user to ping