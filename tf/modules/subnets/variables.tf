variable "project_id" {
    description = "GCP project ID"
    default = "project-id"
}

variable "vpc_name" {
    description = "Name for the network in which the subnet will be built"
    default = "a-a-storesys"
}

variable "subnets" {
    type = list(map(string))
    description = "List of subnets being created"

}

variable "secondary_ranges" {
    type = map(list(object({range_name = string, ip_cidr_range = string })))
    description = "Secondary ranges that will be used for the subnets"
    default = {}
}