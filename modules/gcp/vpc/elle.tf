resource "google_compute_network" "elle" {
  name                    = "elle"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "elle-asia-northeast1" {
  name          = "elle"
  ip_cidr_range = "10.0.0.0/20"
  network       = "${google_compute_network.elle.name}"
  region        = "asia-northeast1"
}

resource "google_compute_subnetwork" "elle-asia-southeast1" {
  name          = "elle"
  ip_cidr_range = "10.2.0.0/20"
  network       = "${google_compute_network.elle.name}"
  region        = "asia-southeast1"
}

resource "google_compute_subnetwork" "elle-asia-east1" {
  name          = "elle"
  ip_cidr_range = "10.4.0.0/20"
  network       = "${google_compute_network.elle.name}"
  region        = "asia-east1"
}
