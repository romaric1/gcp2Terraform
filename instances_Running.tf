#passer le dictionnaire à la template jinja
#boucle qui parcourt les instances et qui remplie les variables
#gérer les tags !!!
#virer le running itérer sur toutes les instances


 
resource "google_compute_instance" "instance-6" {
  name         = "instance-6"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"


  boot_disk {
    device_name = "instance-6"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.195.50.38"
    }
  }

service_account {
  email = "661701253715-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/monitoring.write"]
}
}

 
resource "google_compute_instance" "instance-4" {
  name         = "instance-4"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"


  boot_disk {
    device_name = "instance-4"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "10"
    }
  }

labels {

   monlibelle = "teeest"
   titi = "toto"
}

  network_interface {
    network = "default"

    access_config {
      nat_ip = "34.73.254.238"
    }
  }

service_account {
  email = "661701253715-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/monitoring.write"]
}
}
