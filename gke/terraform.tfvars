gcp_project_id = "silicon-synapse-301513"
provider_region = "us-central1"
cluster_name = "platform-storesys-ci"
initial_node_count = 1
cluster_location = "us-central1"
remove_default_node_pool = true
shielded_nodes = true
binary_authorization = false
client_certificate = false
max_pods_per_node = 110
maintenance_start_time = "10:30"
private_endpoint = false
private_nodes = true
example_cidr_block = "34.67.107.155/32"
example_display_name = "example-authorized-network"
autoscale_min_node = 1
autoscale_max_node = 3
auto_repair = "true"
auto_upgrade = "true"
preemptible = false
metadata = {
    disable-legacy-endpoint = "true"
}
disk_gb_size = 100
network_name = "default"
subnetwork_name = "default"
master_ipv4_cidr_block = "172.16.0.0/28"
security_group = "gke-security-groups@cognizant.com"
node_pool_name = "ci-default"
node_pool_location = "us-central1"
node_machine_type = "n1-standard-1"
node_disk_type = "pd-standard"
node_image_type = "COS"
oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
node_tags = ["gke-platform-storesys-ci", "gke-platform-storesys-ci-ci-default", "gke", "healthchecks"]
node_labels = {
    cluster_name = "platform-storesys-ci"
    node_pool    = "ci-default"
}
secure_boot = "true"
integrity_monitoring = false
