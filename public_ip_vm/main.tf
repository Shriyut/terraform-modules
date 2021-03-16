provider "google" {
        credentials = var.credentials
        project = var.project_id
        //region = "us-central1"
        region = var.region_name
}

module "publicvm" {
    source = "./modules/publicvm"
    public_ip_name = var.public_ip_name
    project_id = var.project_id
    instance_name = var.instance_name
    instance_zone = var.instance_zone
    machine_type = var.machine_type
    instance_tags = var.instance_tags
    auto_delete = var.auto_delete
    disk_device_name = var.disk_name
    disk_mode = var.disk_mode
    disk_size = var.disk_size
    disk_type = var.disk_type
    image_name = var.image_name
    network_name = var.network_name
    //subnetwork = var.subnetwork
    //subnetwork_project = var.subnetwork_project
    //nic_type = var.nic_type
    //alias_ip_range = var.alias_ip_range
    //alias_range_name = var.alias_range_name
    network_tier = var.network_tier

    ip_forward = var.ip_forward
    allow_update = var.allow_update
    description = var.description
    deletion_protection = var.deletion_protection
    status = var.status
    //hostname = var.hostname
    instance_labels = var.labels
    //enable_confidential_compute = var.enable_confidential_compute
    automatic_restart = var.automatic_restart
    maintenance = var.maintenance
    preemptible = var.preemptible
    //node_affinity_key = var.node_affinity_key
    //affinity_operator = var.affinity_operator
    // node_affinity_value = var.node_affinity_value

    //scratch_disk_interface = var.scratch_disk_interface
    block_project_sshkeys = var.block_project_sshkeys
    service_account_email = var.service_account_email
    scope = var.scope 

}
