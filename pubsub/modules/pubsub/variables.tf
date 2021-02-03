variable "topic_name" {
    type = string
    default = "sampletopicname"
}

variable "topic_labels" {
    type = map(string)
    default = {
        topic = "default"
    }
}

variable "project_id" {
    type = string
    default = "cloudglobaldelivery-100135575"
}

variable "topic_kms_key_name" {
    type = string
    description = "Cloud KMS cryptokey to use to access messages published on this topic"
    default = null
}

variable "message_storage_policy" {
    type = map
    description = "A map of storage policies. By default, it inherits it from organization's resource location restriction policy"
    default = {}
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

