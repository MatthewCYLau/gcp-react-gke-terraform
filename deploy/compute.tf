resource "google_container_cluster" "app_cluster" {
  name             = "react-gke-cluster"
  location         = var.region
  enable_autopilot = true
}