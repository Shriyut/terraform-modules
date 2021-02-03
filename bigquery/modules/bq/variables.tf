variable "dataset_id" {
    description = "Dataset id for bigquery"
    default = "dataset_id"
}

variable "friendly_name" {
    description = "Friendly name for the BigQuery dataset"
    default = "friendly_name"
}

variable "dataset_description" {
    description = "Description for the BigQuery Dataset"
    default = ""
}

variable "default_table_expiration_ms" {
    description = "The default lifetime of all tables in the dataset, if not present dataset exists indefinitely"
    default = null
}

variable "project_id" {
    description = "Project where the dataset will be created"
    default = "cloudglobaldelivery-1000135575"
}

variable "location" {
    default = "US"
}

variable "delete_contents_on_destroy" {
    description = "If set to true, all tables in dataset will be deleted when destroying the reosurce or else destroy will fail"
    default = true
}

variable "dataset_labels" {
    description = "Labels for the dataset"
    type = map(string)
    default = {
        env = "default"
}
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