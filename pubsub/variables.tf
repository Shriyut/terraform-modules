variable "project_id" {
    default = "cloudglobaldelivery-1000135575"
}

variable "provider_region" {
    default = "us-central1"
}

variable "create_topic" {
  type        = bool
  description = "Specify true if you want to create a topic"
  default     = true
}

variable "topic_name" {
    default = "sampletopicname"
}

variable "topic_labels" {
    type = map(string)
    default = {
        topic = "default"
    }
}

variable "pull_subscriptions" {
    type = list(map(string))
    description = "The list of pull subscriptions"
    default = []
}

variable "push_subscriptions" {
  type        = list(map(string))
  description = "The list of the push subscriptions"
  default     = []
}
