project_id = "cloudglobaldelivery-1000135575"
provider_region = "us-central1"
topic_name = "testtopic"
topic_labels = {
    env = "terraform"
}

pull_subscriptions = [  
    {
        name = "pullsubscriptiondemo"
        message_retention_duration = "1200s"
        retain_acked_messages = true

        ack_deadline_seconds = 20
        
    },
]

push_subscriptions = [
    {
        name = "pushsuscriptiondemo"
        ack_deadline_seconds = 20
        message_retention_duration = "1200s"

        push_endpoint = "https://example.com"
        x-goog-version = "v1beta1"
    },
]