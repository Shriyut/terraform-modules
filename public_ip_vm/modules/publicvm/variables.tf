variable "public_ip_name" {}
variable "project_id" {}
variable "instance_name" {}
variable "machine_type" {}
variable "instance_zone" {}
variable "instance_tags" {
  type = list(string)
  default = ["foo", "bar"]
}
variable "image_name" {}
variable "network_name" {}
//variable "subnetwork" {}
//variable "subnetwork_project" {}
//variable "nic_type" {}
//variable "alias_ip_range" {}
//variable "alias_range_name" {}
variable "network_tier" {}


variable "ip_forward" {}
variable "allow_update" {}
variable "description" {}
variable "deletion_protection" {}
variable "status" {}
//variable "hostname" {}
variable "instance_labels" {
  type = map(string)
  default = {
      created_by = "Terraform"
  }
}
variable "auto_delete" {}
variable "disk_device_name" {}
variable "disk_mode" {}
variable "disk_size" {}
variable "disk_type" {}
// variable "enable_confidential_compute" {}
variable "automatic_restart" {}
variable "maintenance" {}
variable "preemptible" {}
//variable "node_affinity_key" {}
// variable "affinity_operator" {}
// variable "node-node_affinity_value" {}
//variable "scratch_disk_interface" {}
variable "block_project_sshkeys" {}
variable "service_account_email" {}
variable "scope" {
    type = list(string)
    default = ["cloud-platform"]
}
