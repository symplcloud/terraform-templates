provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

resource "google_compute_instance" "default" {
  name = "instance-1"
  zone = "us-central1-a"
  # network_interface {
  #   access_config {
  #     assigned_nat_ip = ""
  #     # "nat_ip": "34.70.220.123",
  #     network_tier           = "PREMIUM"
  #     public_ptr_domain_name = ""
  #   }
  #   name               = "nic0"
  #   network            = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/default"
  #   subnetwork         = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${var.region}/subnetworks/default"
  #   subnetwork_project = "${var.project_id}"
  # }
  network_interface {
    network = "default"
  }
  # boot_disk {
  #   auto_delete = true
  #   initialize_params {
  #     image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20190813a"
  #     size  = 10
  #     type  = "pd-standard"
  #   }
  # }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  # machine_type = "n2-highcpu-2"
  #   machine_type = "n1-standard-2"
  # machine_type = "n2-standard-2"
  # machine_type = "n2-standard-4"
  #   machine_type = "custom-1-2048"
  machine_type = "custom-2-4096"
  allow_stopping_for_update = true
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