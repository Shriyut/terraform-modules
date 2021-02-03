provider_region = "us-central1"
vpc_name = "a-a-storesys-vpc"
auto_create_subnetworks = false
routing_mode = "REGIONAL"
project_id = "cloudglobaldelivery-1000135575"
delete_default_routes_on_create = false
subnets = [
    {
        subnet_name = "test-subnet"
        subnet_ip = "10.10.30.0/24"
        subnet_region = "us-central1"
        subnet_private_access = "true"
        subnet_flow_logs = "true"
        description = "Test subnet to check creation via terraform modules"
        subent_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 0.7
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
]
secondary_ranges = {
    test-subnet = [
        {
            range_name = "subnet-01-secondary"
            ip_cidr_range = "192.168.64.0/24"
        }
    ]
}