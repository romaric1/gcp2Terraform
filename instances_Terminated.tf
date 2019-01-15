

 
resource "google_compute_instance" "drouot-tomcat-recette-gazette-0" {
  name         = "drouot-tomcat-recette-gazette-0"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-d"


  tags = ["http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-gazette-0-disk"
    auto_delete = "False"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/drouot-164214/global/images/gazette-recette"
      size = "80"
    }
  }


  
  attached_disk {
    source = "https://www.googleapis.com/compute/v1/projects/drouot-dev/zones/europe-west1-d/disks/drouot-tomcat-recette-gazette-data-disk"
    mode = "READ_WRITE"
  }
  



  network_interface {
    network = "default"

    access_config {
      nat_ip = ""
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/sqlservice.admin", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/devstorage.read_only"]
  
}

}
