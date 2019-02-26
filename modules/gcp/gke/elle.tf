resource "google_container_cluster" "elle" {
  name               = "elle"
  min_master_version = "1.11.7-gke.6"
  node_version       = "1.11.7-gke.6"
  zone               = "${var.zone}"
  initial_node_count = "${var.min_node_count}"
  network            = "${var.vpc_network_elle_self_link}"
  subnetwork         = "${var.vpc_subnetwork_elle_asia_northeast1_self_link}"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "05:00"
    }
  }

  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name      = "${format("elle-%02d", count.index + 1)}"
      deploy    = "elle"
      workspace = "${terraform.workspace}"
      env       = "${terraform.env}"
    }

    tags = [
      "${terraform.workspace}",
      "${format("elle-%02d", count.index + 1)}",
      "elle",
    ]
  }
}

resource "google_container_node_pool" "elle-np" {
  name               = "elle-np"
  zone               = "${var.zone}"
  version            = "1.11.7-gke.6"
  cluster            = "${google_container_cluster.elle.name}"
  initial_node_count = "${var.min_node_count}"

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    disk_size_gb = "30"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]

    labels = {
      name      = "${format("elle-np-%02d", count.index + 1)}"
      deploy    = "elle-np"
      workspace = "${terraform.workspace}"
      env       = "${terraform.env}"
    }

    tags = [
      "${terraform.workspace}",
      "${format("elle-np-%02d", count.index + 1)}",
      "elle-np",
    ]
  }
}


