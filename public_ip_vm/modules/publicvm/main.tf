data "google_compute_address" "vmip" {
      // already created static ip
      name    = var.public_ip_name
      project = var.project_id
}

resource "google_compute_instance" "vm" {
        name                          = var.instance_name
        machine_type                  = var.machine_type
        zone                          = var.instance_zone
        tags                          = var.instance_tags
        can_ip_forward                = var.ip_forward
        allow_stopping_for_update     = var.allow_update
        description                   = var.description
        deletion_protection           = var.deletion_protection
        desired_status                = var.status
        // hostname = var.hostname
        labels                        = var.instance_labels

        boot_disk {
                auto_delete           = var.auto_delete
                device_name           = var.disk_device_name
                mode                  = var.disk_mode
                initialize_params {
                        size          = var.disk_size
                        type          = var.disk_type
                        image         = var.image_name
                }
        }

        //attached_disk {
        //    source =
        //    device_name =
        //    mode =
        //    disk_encryption_key_raw =
        //    kms_key_self_link =
        //}

        //confidential_instance_config {
        // on host maintenance must be set to terminate for this to work or else VM will not be created
        //   enable_confidential_compute  = var.enable_confidential_compute
        //}

        scheduling {
          automatic_restart             = var.automatic_restart
          on_host_maintenance           = var.maintenance
          preemptible                   = var.preemptible
          //node_affinities {
          //     key      = var.node_affinity_key
          //     operator = var.affinity_operator
          //     values   = var.node_affinity_value
          //  }
        }

        //scratch_disk {

        //    interface = var.scratch_disk_interface
        //}


        network_interface {

                network                 = var.network_name
                //subnetwork            = var.subnetwork
                //subnetwork_project    = var.subnetwork_project
                //nic_type              = var.nic_type

                // remove access_config block for VMs with no public ip
                access_config {
                        nat_ip          = data.google_compute_address.vmip.address
                        network_tier    = var.network_tier

                }

                //alias_ip_range {
                //    ip_cidr_range = var.alias_ip_range
                //    subnetwork_range_name = var.alias_range_name
                //}
        }

        metadata = {
              block-project-ssh-keys  = var.block_project_sshkeys
        }

         metadata_startup_script      = "cd /; echo hi > /test.txt"

         service_account {
         # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
         email                        = var.service_account_email
         scopes                       = var.scope
         }

}
