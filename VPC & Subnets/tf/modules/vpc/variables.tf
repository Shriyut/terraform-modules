variable "vpc_name" {
    description = "VPC name for the network being created"
    default = "vpc-name"
}

variable "auto_create_subnetworks" {
    type = bool
    description = "If set to true, vpc is created in auto mode or else in custom subnet mode"
    default = false
}

variable "routing_mode" {
    type = string
    default = "GLOBAL"
    description = "Routing mode for the network, value can be regional or global"
}

variable "project_id" {
    description = "Project in which the VPC will be created"
    default = "project-id"
}

variable "description" {
    type = string
    default = ""
}

variable "delete_default_routes_on_create" {
    type = bool
    description = "If set to true, all default routes with next hop to default internal gateway are deleted"
    default = false
}