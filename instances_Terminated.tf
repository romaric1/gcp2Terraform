#passer le dictionnaire à la template jinja
#boucle qui parcourt les instances et qui remplie les variables
#gérer les tags !!!
#virer le running itérer sur toutes les instances


 
resource "google_compute_instance" "instance-3" {
  name         = "instance-3"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"


  tags = ["nettest"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9-stretch"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = ""
    }
  }

}

 
resource "google_compute_instance" "instance-5" {
  name         = "instance-5"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9-stretch"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "mynetwork"

    access_config {
      nat_ip = ""
    }
  }

}
