locals {
  tables = { for table in var.tables : table["table_id"] => table }
  views = { for view in var.views : view["view_id"] => view }

  iam_to_primitive = {
    "roles/bigquery.dataOwner": "OWNER"
    "roles/bigquery.dataEditor": "EDITOR"
    "roles/bigquery.dataViewer": "READER"
  }
}

resource "google_bigquery_dataset" "dataset" {
    dataset_id = var.dataset_id
    friendly_name = var.friendly_name
    description = var.dataset_description
    default_table_expiration_ms = var.default_table_expiration_ms
    project = var.project_id
    location = var.location

    labels = var.dataset_labels
    
    delete_contents_on_destroy = var.delete_contents_on_destroy

    dynamic "access" {
      for_each = var.access
      content {
        role = lookup(local.iam_to_primitive, access.value.role, access.value.role)

        domain = lookup(access.value, "domain", null)
        group_by_email = lookup(access.value, "group_by_email", null)
        user_by_email = lookup(access.value, "user_by_email", null)
        special_group = lookup(access.value, "special_group", null)
      }
    }
}

resource "google_bigquery_table" "table" {
  for_each = local.tables
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  friendly_name = each.key
  table_id = each.key
  labels = each.value["labels"]
  schema = file(each.value["schema"])
  clustering = each.value["clustering"]
  expiration_time = each.value["expiration_time"]
  project = var.project_id

  dynamic "time_partitioning" {
    for_each = each.value["time_partitioning"] != null ? [each.value["time_partitioning"]] : []
    content {
      type = time_partitioning.value["type"]
      expiration_ms = time_partitioning.value["expiration_ms"]
      field = time_partitioning.value["field"]
      require_partition_filter = time_partitioning.value["require_partition_filter"]
    }
  }
}

resource "google_bigquery_table" "view" {
  for_each = local.views
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  friendly_name = each.key
  table_id = each.key
  labels = each.value["labels"]
  project = var.project_id

  view {
    query = each.value["query"]
    use_legacy_sql = each.value["use_legacy_sql"]
  }
  depends_on = [google_bigquery_table.table]


}