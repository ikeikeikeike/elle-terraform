terraform {
  required_version = ">= 0.11.10"

  backend "gcs" {
    bucket = "elle-tf-tfstate"
    prefix = "elle/tf.tfstate"
  }
}
