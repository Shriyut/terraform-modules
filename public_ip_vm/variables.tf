variable "credentials" {}
variable "region_name" {}

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
//variable "nic_type" {}  GVNIC/VIRTIO_NET
//variable "alias_ip_range" {}
//variable "alias_range_name" {}
variable "network_tier" {}


variable "ip_forward" {}
variable "allow_update" {}
variable "description" {}
variable "deletion_protection" {} // this entity must be set to false for terraform destroy to work
variable "status" {} //can be RUNNING or TERMINATED
//variable "hostname" {} //fully qualified domain name
variable "labels" {
  type = map(string)
  default = {
      created_by = "Terraform"
  }
}
variable "auto_delete" {}
variable "disk_name" {}   // Name with which attached disk will be accessible. On the instance, this device will be /dev/disk/by-id/google-{{device_name}}
variable "disk_mode" {}
variable "disk_size" {}
variable "disk_type" {}
//variable "enable_confidential_compute" {}
variable "automatic_restart" {}
variable "maintenance" {}
variable "preemptible" {} // if preemptible is set to true, automatic restart must be set to false
//variable "node_affinity_key" {} //not specified in tfvars
// variable "affinity_operator" {} // not specified in tfvar IN / NOT_IN
// variable "node-node_affinity_value" {} //not specified in tfvars
//variable "scratch_disk_interface" {} // SCSI or NVME
variable "block_project_sshkeys" {}
variable "service_account_email" {}
variable "scope" {
    type = list(string)
    default = ["cloud-platform"]
}
