resource "google_container_cluster" "primary" {
  name               = "daily-report-cluster"
  location           = data.google_compute_zones.available.names[0]
  initial_node_count = 2

  node_version       = "1.12"
  min_master_version = "1.12"

//  node_locations = [
//    data.google_compute_zones.available.names[1],
//  ]

  master_auth {
    username = var.username
    password = var.password
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "daily-report-node-pool"
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = 4

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
