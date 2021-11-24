resource "google_sql_database_instance" "master" {
  name             = "master-instance"
  database_version = "MYSQL_8_0"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
    backup_configuration {
      binary_log_enabled = "true"
      enabled            = "true"

    }
  }
}