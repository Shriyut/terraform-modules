project_id = "cloudglobaldelivery-1000135575"
provider_region = "us-central1"
dataset_id = "testbqdataset1234"
friendly_name = "testdataset"
dataset_description = "Created via Terraform"
location = "US"
default_table_expiration_ms = 3600000
domain_name = "cognizant.com"
delete_contents_on_destroy = true
tables = [
    {
        table_id = "atesttable",
        schema = "sample_bq_schema.json",
        time_partitioning = {
            type = "DAY"
            field = null
            require_partition_filter = false,
            expiration_ms = null,
        },
        expiration_time = null,
        clustering = [],
        labels = {
            env = "dev"
        },
    },
]

views = [
    {
        view_id = "atestview"
        use_legacy_sql = false,
        query = <<EOF
            SELECT
                fullVisitorId,
                visitId
            FROM
                `cloudglobaldelivery-1000135575.testbqdataset1234.atesttable`
            EOF
            labels = {
                env = "devops"
            }
    }
]