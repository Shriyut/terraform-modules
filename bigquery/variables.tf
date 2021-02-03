variable "project_id" {
    description = "Project id of the GCP project"
    default = "cloudglobaldelivery-1000135575"
}

variable "provider_region" {
    description = "GCP region for the resources beinf created through the script"
    default = "us-central1"
}

variable "dataset_id" {
    description = "Dataset ID for the BigQuery dataset"
    default = "a-dataset-id"
}

variable "friendly_name" {
    description = "Friendly name for the dataset being created"
    default = "dataset_friendly_name"
}

variable "dataset_description" {
    description = "Description for dataset"
    default = ""
}

variable "location" {
    description = "Geogrphic location where dataset would reside, can be regional or multi-regional"
    default = "US"
}

variable "default_table_expiration_ms" {
    default = null
}

variable "domain_name" {
        default = "macys.com"
}
variable "dataset_labels" {
    default = {
        env = "default"
    }
}

variable "delete_contents_on_destroy" {
    default = true
}

variable "access" {
    description = "Specifying dataset access for different entities"
    type = any

    default = [
        {
            role = "roles/bigquery.dataOwner"
            special_group = "projectOwners"
        }
    ]
}

variable "tables" {
    description = "A list of maps that includes table_id, schema, clustering, time_partitioning, expiration_time, labels in wach element."
    default = []
    type = list(object({
        table_id = string,
        schema = string,
        clustering = list(string),
        time_partitioning = object({
            expiration_ms = string,
            field = string,
            type = string,
            require_partition_filter = bool,
        }),
        expiration_time = string,
        labels = map(string),
    }))
}

variable "views" {
    description = "A list of objects which include table_id, which is view_id, and view query"
    default = []
    type = list(object({
		view_id = string,
        query = string,
        use_legacy_sql = bool,
        labels = map(string)
    }))
}