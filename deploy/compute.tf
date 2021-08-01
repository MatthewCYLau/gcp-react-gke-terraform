resource "google_container_cluster" "app_cluster" {
  name             = "react-gke-cluster"
  location         = var.region
  enable_autopilot = true
}

resource "google_compute_global_address" "external_static_ip" {
  name         = "react-gke-static-ip"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
  project      = var.project
  description  = "External static IP address for React GKE app"
}