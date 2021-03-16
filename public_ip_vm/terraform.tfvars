credentials = "credentials.json"
region_name = "us-central1"
public_ip_name = "static"
project_id = "silicon-synapse-301513"
instance_name = "testvm"
machine_type = "n1-standard-1"
instance_zone = "us-central1-a"
image_name = "centos-7-v20190905"
network_name = "default"
//subnetwork = us-central1
//subnetwork_project = "" subnetwork and subnetwork project are used together for shared vpc configuration, subnetwork project will be the project id with host vpc
//nic_type = ""
//alias_ip_range = "10.24.1.0/24"
//alias_range_name "samplename"
network_tier = "PREMIUM"

ip_forward = true
allow_update = true
description = "Created via Terraform"
deletion_protection = false
status = "RUNNING"
//hostname = ""
labels = {
    demo = "label"
}
auto_delete = true
disk_name = "test_name"
disk_mode = "READ_WRITE"
disk_size = 10
disk_type = "pd-standard"
//enable_cofidential_compute = true
automatic_restart = true
maintenance = "MIGRATE"
preemptible = false
//scratch_disk_interface = "SCSI"
block_project_sshkeys = true
service_account_email = "owner-923@silicon-synapse-301513.iam.gserviceaccount.com"
scope = ["cloud-platform"]
