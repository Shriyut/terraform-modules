provider "google"{
    credentials = "${file("credentials.json")}"
    project = var.project_id
    region = var.provider_region
}

module "vpc" {
    source = "./modules/vpc"
    vpc_name = var.vpc_name
    auto_create_subnetworks = var.auto_create_subnetworks
    routing_mode = var.routing_mode
    project_id = var.project_id
    description = var.description
    delete_default_routes_on_create = var.delete_default_routes_on_create
}

module "subnets" {
    source = "./modules/subnets"
    project_id = var.project_id
    vpc_name = module.vpc.vpc_name
    subnets = var.subnets
    secondary_ranges = var.secondary_ranges
}