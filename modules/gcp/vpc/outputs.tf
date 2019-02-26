output "network_elle_name"                          { value = "${google_compute_network.elle.name }" }
output "network_elle_self_link"                     { value = "${google_compute_network.elle.self_link }" }
output "subnetwork_elle_asia_northeast1_name"       { value = "${google_compute_subnetwork.elle-asia-northeast1.name }" }
output "subnetwork_elle_asia_northeast1_self_link"  { value = "${google_compute_subnetwork.elle-asia-northeast1.self_link }" }
output "global_address_elle_lb_address"             { value = "${google_compute_global_address.elle-lb.address }" }

