#passer le dictionnaire à la template jinja
#boucle qui parcourt les instances et qui remplie les variables

 
resource "google_compute_instance" "default0" {
  name         = "instance-1"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  tags = ['tata', 'test', 'toto']

  boot_disk {
    initialize_params {
      image = "debian-9-stretch"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "104.199.94.190"
    }
  }

}

 
resource "google_compute_instance" "default1" {
  name         = "instance-3"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  tags = ['nettest']

  boot_disk {
    initialize_params {
      image = "debian-9-stretch"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.241.168.246"
    }
  }

}
