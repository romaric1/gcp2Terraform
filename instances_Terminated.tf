#passer le dictionnaire à la template jinja
#boucle qui parcourt les instances et qui remplie les variables
#gérer les tags !!!
#virer le running itérer sur toutes les instances


 
resource "google_compute_instance" "instance-5" {
  name         = "instance-5"
  machine_type = "n1-standard-1"
  zone         = "asia-east1-b"


  boot_disk {
    device_name = "instance-5"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = ""
    }
  }

service_account {
  email = "661701253715-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/monitoring.write"]
}
}
