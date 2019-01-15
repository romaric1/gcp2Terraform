

 
resource "google_compute_instance" "expertissim-recette-elasticsearch" {
  name         = "expertissim-recette-elasticsearch"
  machine_type = "n1-standard-1"
  zone         = "us-central1-c"


  boot_disk {
    #device_name = "expertissim-recette-elasticsearch"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20180716"
      size = "10"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.238.86.222"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "drouot-recette-solr-1" {
  name         = "drouot-recette-solr-1"
  machine_type = "n1-standard-16"
  zone         = "europe-west1-b"


  tags = ["drouot-recette-solr"]

  boot_disk {
    #device_name = "drouot-recette-solr-1"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "350"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "104.199.106.10"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "drouot-recette-solr-2" {
  name         = "drouot-recette-solr-2"
  machine_type = "n1-standard-4"
  zone         = "europe-west1-b"


  tags = ["drouot-recette-solr"]

  boot_disk {
    #device_name = "drouot-recette-solr-2"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "350"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.195.202.74"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "drouot-recette-solr-3" {
  name         = "drouot-recette-solr-3"
  machine_type = "n1-standard-4"
  zone         = "europe-west1-b"


  tags = ["drouot-recette-solr"]

  boot_disk {
    #device_name = "drouot-recette-solr-3"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20181210"
      size = "350"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.195.118.101"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "expertissim-recette-site" {
  name         = "expertissim-recette-site"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"


  boot_disk {
    #device_name = "expertissim-recette-site"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1404-trusty-v20180703"
      size = "10"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.233.82.100"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "drouot-recette-jobs-0" {
  name         = "drouot-recette-jobs-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-recette-jobs-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180510"
      size = "50"
    }
  }


  
  attached_disk {
    source = "https://www.googleapis.com/compute/v1/projects/drouot-dev/zones/europe-west1-d/disks/jobs-data-disk"
    mode = "READ_WRITE"
  }
  



  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.205.106.71"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-recette-redis-0" {
  name         = "drouot-recette-redis-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-recette-redis-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180507"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.233.2.54"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-recette-solr-0" {
  name         = "drouot-recette-solr-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server", "solr"]

  boot_disk {
    #device_name = "drouot-solr-recette-disk"
    auto_delete = "False"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/drouot-164214/global/images/drouot-solr-prod-20181128"
      size = "300"
    }
  }


  
  attached_disk {
    source = "https://www.googleapis.com/compute/v1/projects/drouot-dev/zones/europe-west1-d/disks/drouot-solr-recette-data-20181130"
    mode = "READ_WRITE"
  }
  



  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.240.112.158"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-red5-recette-stream-0" {
  name         = "drouot-red5-recette-stream-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["http-server", "https-server", "red5"]

  boot_disk {
    #device_name = "drouot-red5-recette-stream-0-disk"
    auto_delete = "False"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/drouot-164214/global/images/red5-recette"
      size = "40"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.195.56.232"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append"]
  
}

}

 
resource "google_compute_instance" "drouot-tomcat-recette-admin-0" {
  name         = "drouot-tomcat-recette-admin-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-admin-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180507"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "104.155.104.65"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-tomcat-recette-api-0" {
  name         = "drouot-tomcat-recette-api-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-api-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180510"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.240.94.85"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-tomcat-recette-bid-0" {
  name         = "drouot-tomcat-recette-bid-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-bid-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180510"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "192.158.28.180"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-tomcat-recette-catalog-0" {
  name         = "drouot-tomcat-recette-catalog-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-catalog-0-disk"
    auto_delete = "False"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/drouot-164214/global/images/catalog-recette"
      size = "80"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "104.155.87.126"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/sqlservice.admin", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/trace.append", "https://www.googleapis.com/auth/devstorage.read_only"]
  
}

}

 
resource "google_compute_instance" "drouot-tomcat-recette-drouot-com-0" {
  name         = "drouot-tomcat-recette-drouot-com-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-drouot-com-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180611"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "146.148.123.186"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-tomcat-recette-drouotdigital-0" {
  name         = "drouot-tomcat-recette-drouotdigital-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-drouotdigital-0-disk"
    auto_delete = "False"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/drouot-164214/global/images/ddv3-loadtest"
      size = "30"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "146.148.121.161"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "drouot-tomcat-recette-live-0" {
  name         = "drouot-tomcat-recette-live-0"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  tags = ["custom-cloudsql-access", "http-server", "https-server"]

  boot_disk {
    #device_name = "drouot-tomcat-recette-live-0"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-8-jessie-v20180510"
      size = "50"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.205.87.199"
    }
  }

# faire un if de service_account car instance sans services account

}

 
resource "google_compute_instance" "expertissim-recette-rabbitmq" {
  name         = "expertissim-recette-rabbitmq"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"


  boot_disk {
    #device_name = "expertissim-recette-rabbitmq"
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20180716"
      size = "10"
    }
  }




  network_interface {
    network = "default"

    access_config {
      nat_ip = "104.199.43.183"
    }
  }

# faire un if de service_account car instance sans services account

service_account {
  
  email = "485804294383-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append"]
  
}

}
