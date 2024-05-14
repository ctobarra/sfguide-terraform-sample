resource "snowflake_database" "simple" {
  name                        = "Terraform_tests"
  comment                     = "This database is to test the terraforming process"
  # data_retention_time_in_days = 3
}