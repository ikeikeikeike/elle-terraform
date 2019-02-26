resource "google_storage_bucket" "elle-storage" {
  name          = "elle-storage-${terraform.env}"
  location      = "asia-northeast1"
  storage_class = "REGIONAL"

  labels = {
    name      = "elle-storage"
    deploy    = "elle-storage"
    workspace = "${terraform.workspace}"
    env       = "${terraform.env}"
  }
}
