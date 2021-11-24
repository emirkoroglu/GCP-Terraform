variable "vm_config" {
  type = map(any)
  default = {
    region        = "us-central1"
    zone          = "us-central1-c"
    instance_name = "terraform-instance"
    machine_type  = "f1-micro"
    image         = "debian-cloud/debian-9"
    firewall_name = "fw-allow-http"
    network_tags  = "webserver"
  }
}

variable "labels" {
  type = map(any)
  default = {
    name    = "db"
    env     = "dev"
    team    = "devops"
    quarter = "first"
    builtby = "me"
  }
}

variable "config" {
  type = map(any)
  default = {
    region = "us-central1"
    zone   = "us-central1-c"
    name   = "test-disk"
    type   = "pd-ssd"
    size   = 5
    # Labels
    environment = "dev"
  }
}


// variable "gke_config" {
//   type = map(any)
//   default = {
//     region         = "us-central1"
//     zone           = "us-central1-c"
//     cluster_name   = "my-gke-cluster"
//     machine_type   = "e2-medium"
//     node_count     = 1
//     node_pool_name = "my-node-pool"
//     preemptible    = true
//   }
// }

variable "bucket_config" {
  type = map(any)
  default = {
    region          = "us-central1"
    zone            = "us-central1-c"
    bucket_location = "US"
  }
}
