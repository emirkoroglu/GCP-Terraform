resource "google_filestore_instance" "instance" {
  provider = google-beta
  name     = "test-instance"
  zone     = "us-central1-b"
  tier     = "BASIC_HDD"
  project  = "terrafom-333108"


  file_shares {
    capacity_gb = 1024
    name        = "share1"

    nfs_export_options {
      ip_ranges   = ["10.0.0.0/24"]
      access_mode = "READ_WRITE"
      squash_mode = "NO_ROOT_SQUASH"
    }
  }

  networks {
    network      = "default"
    modes        = ["MODE_IPV4"]
    connect_mode = "DIRECT_PEERING"
  }
}

output "ID" {
  value = google_filestore_instance.instance.id
}