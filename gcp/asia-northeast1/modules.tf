
module "vpc" {
  source = "../../modules/gcp/vpc"
}

module "gcs" {
  source = "../../modules/gcp/gcs"
}

module "gke" {
  source = "../../modules/gcp/gke"

  zone                                          = "${lookup(var.zone, "${terraform.workspace}")}"

  vpc_network_elle_name                         = "${module.vpc.network_elle_name}"
  vpc_network_elle_self_link                    = "${module.vpc.network_elle_self_link}"
  vpc_subnetwork_elle_asia_northeast1_name      = "${module.vpc.subnetwork_elle_asia_northeast1_name}"
  vpc_subnetwork_elle_asia_northeast1_self_link = "${module.vpc.subnetwork_elle_asia_northeast1_self_link}"
  min_node_count                                = "${lookup(var.min_node_count, "${terraform.workspace}.elle")}"
  max_node_count                                = "${lookup(var.max_node_count, "${terraform.workspace}.elle")}"
}

# module "dns" {
  # source = "../../modules/gcp/dns"

  # google_project                               = "${var.google_project}"
  # vpc_global_address_elle_lb_address           = "${module.vpc.global_address_elle_lb_address}"
# }

module "sql" {
  source = "../../modules/gcp/sql"

  region                                        = "${lookup(var.region, "${terraform.workspace}")}"

  elle_dbuser                                   = "${var.elle_dbuser}"
  elle_dbpass                                   = "${var.elle_dbpass}"
}

