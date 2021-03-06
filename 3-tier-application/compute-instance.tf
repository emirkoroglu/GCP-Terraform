resource "google_compute_instance" "vm_instance" {
  name         = var.vm_config["instance_name"]
  machine_type = var.vm_config["machine_type"]
  zone         = var.vm_config["zone"]
  boot_disk {
    initialize_params {
      image = var.vm_config["image"]
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  labels = var.labels
  tags   = [var.vm_config["network_tags"]]

  metadata_startup_script = file("userdata.sh")

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

resource "google_compute_firewall" "allow-http" {
  name    = var.vm_config["firewall_name"]
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "22", "3306"]
  }
  source_tags = [var.vm_config["network_tags"]]
}
