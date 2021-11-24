provider "google" {
  // enter your project id to project
  project = "terrafom-333108"
  region  = var.vm_config["region"]
  zone = var.vm_config["zone"]
}