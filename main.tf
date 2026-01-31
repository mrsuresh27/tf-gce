
resource "google_compute_network" "custom_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.custom_vpc.id
}

resource "google_compute_firewall" "custom_firewall" {
  name    = "allow-ssh-icmp"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "vm_static_ip" {
  name = "ipv4-address"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["ssh-allowed"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = google_compute_network.custom_vpc.name
    subnetwork = google_compute_subnetwork.custom_subnet.name
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }

  metadata = {
    block-project-ssh-keys = true
  }
}
