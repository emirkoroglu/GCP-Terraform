resource "google_sql_database_instance" "master" {
  name                = "master-instance"
  database_version    = "MYSQL_8_0"
  region              = "us-central1"
  deletion_protection = "false" 
  // if deletion_protection set true terraform destroy will not delete the instance

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