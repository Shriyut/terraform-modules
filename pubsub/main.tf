provider "google" {
    credentials = file("credentials.json")
    project = var.project_id
    region = var.provider_region
}

module "pubsub" {
    source = "./modules/pubsub"
    project_id = var.project_id
    topic_name = var.topic_name
    topic_labels = var.topic_labels

    pull_subscriptions = var.pull_subscriptions
    push_subscriptions = var.push_subscriptions
}