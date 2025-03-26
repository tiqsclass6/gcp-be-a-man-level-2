variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "PROJECT-ID-HERE" # Replace with your project ID
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "be-a-man-level-2-vpc" # Replace with your desired VPC name
}

variable "subnets" {
  description = "A list of subnets to create" # Will create your private subnets automatically
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
  default = [
    {
      name          = "iowa-subnet"
      region        = "us-central1" # Replace with your default region
      ip_cidr_range = "10.231.0.0/16" # Replace with your desired IP range
    },
    {
      name          = "london-subnet"
      region        = "europe-west2" # Replace with your second region
      ip_cidr_range = "10.233.0.0/16" # Replace with your second IP range
    },
    {
      name          = "tokyo-subnet"
      region        = "asia-northeast1" # Replace with your third region
      ip_cidr_range = "10.235.0.0/16" # Replace with your third IP range
    }
  ]
}