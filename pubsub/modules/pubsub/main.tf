locals {
  default_ack_deadline_seconds = 20
}

resource "google_pubsub_topic" "topic" {
    count = var.create_topic ? 1 : 0
    name = var.topic_name
    labels = var.topic_labels
    project = var.project_id
    kms_key_name = var.topic_kms_key_name

    dynamic "message_storage_policy" {
        for_each = var.message_storage_policy
        content {
            allowed_persistence_regions = message_storage_policy.key == "allowed_persistence_regions" ? message_storage_policy.value : null
        }
    }
}

resource "google_pubsub_subscription" "pull_subscriptions" {
  count   = var.create_topic ? length(var.pull_subscriptions) : 0
  name    = var.pull_subscriptions[count.index].name
  topic   = google_pubsub_topic.topic.0.name
  project = var.project_id
  ack_deadline_seconds = lookup(
    var.pull_subscriptions[count.index],
    "ack_deadline_seconds",
    local.default_ack_deadline_seconds,
  )
  message_retention_duration = lookup(
    var.pull_subscriptions[count.index],
    "message_retention_duration",
    null,
  )

  depends_on = [google_pubsub_topic.topic]
}

resource "google_pubsub_subscription" "push_subscriptions" {
  count   = var.create_topic ? length(var.push_subscriptions) : 0
  name    = var.push_subscriptions[count.index].name
  topic   = google_pubsub_topic.topic.0.name
  project = var.project_id
  ack_deadline_seconds = lookup(
    var.push_subscriptions[count.index],
    "ack_deadline_seconds",
    local.default_ack_deadline_seconds,
  )
  message_retention_duration = lookup(
    var.push_subscriptions[count.index],
    "message_retention_duration",
    null,
  )

  push_config {
    push_endpoint = var.push_subscriptions[count.index]["push_endpoint"]

    // FIXME: This should be programmable, but nested map isn't supported at this time.
    //   https://github.com/hashicorp/terraform/issues/2114
    attributes = {
      x-goog-version = lookup(var.push_subscriptions[count.index], "x-goog-version", "v1")
    }
  }

  depends_on = [google_pubsub_topic.topic]
}

