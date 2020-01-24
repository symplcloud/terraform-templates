provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_address" "external" {
  name = "external"
}

resource "google_compute_instance" "default" {
  name = "instance-1"
  zone = "us-east4-a"

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external.address
    }
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  # machine_type = "n1-standard-1"
  # machine_type = "n2-highcpu-2"
  # machine_type = "n1-standard-2"
  # machine_type = "n2-standard-2"
  # machine_type = "n2-standard-4"
  machine_type = "custom-2-2048"
  # machine_type = "custom-2-4096"
  allow_stopping_for_update = true

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}
