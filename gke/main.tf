provider "google" {
  credentials = file("credentials.json")
  project     = var.gcp_project_id
  region      = var.provider_region
}

provider "google-beta" {
  credentials = file("credentials.json")
  project = var.gcp_project_id
  region = var.provider_region
}

module "gke" {
  source = "./modules/gke"
  cluster_name = var.cluster_name
  cluster_location = var.cluster_location
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count = var.initial_node_count
  shielded_nodes = var.shielded_nodes
  binary_authorization = var.binary_authorization
  client_certificate = var.client_certificate
  network_name = var.network_name
  subnetwork_name = var.subnetwork_name
  max_pods_per_node = var.max_pods_per_node
  maintenance_start_time = var.maintenance_start_time
  secure_boot = var.secure_boot
  integrity_monitoring = var.integrity_monitoring
  private_endpoint = var.private_endpoint
  private_nodes = var.private_nodes
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  example_cidr_block = var.example_cidr_block
  example_display_name = var.example_display_name
  security_group = var.security_group

  node_pool_name  =  var.node_pool_name
  node_pool_location = var.node_pool_location
  autoscale_min_node = var.autoscale_min_node
  autoscale_max_node = var.autoscale_max_node
  auto_repair = var.auto_repair
  auto_upgrade = var.auto_upgrade
  preemptible = var.preemptible
  node_machine_type = var.node_machine_type
  metadata = var.metadata
  disk_gb_size = var.disk_gb_size
  node_disk_type = var.node_disk_type
  node_image_type = var.node_image_type
  oauth_scopes = var.oauth_scopes
  node_tags = var.node_tags
  node_labels = var.node_labels


}
