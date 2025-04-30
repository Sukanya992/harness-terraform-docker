provider "google" {
  project = "plated-epigram-452709-h6"
  region  = "us-central1"
}

resource "google_compute_instance" "vm_instance" {
  name         = "harness-ci-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20240115"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = file("startup.sh")
}
