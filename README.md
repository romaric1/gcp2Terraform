# gcp2Terraform
[![CircleCI](https://circleci.com/gh/romaric1/gcp2Terraform/tree/master.svg?style=svg)](https://circleci.com/gh/romaric1/gcp2Terraform/tree/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/2a59bdbdf758a3d19c8e/maintainability)](https://codeclimate.com/github/romaric1/gcp2Terraform/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2a59bdbdf758a3d19c8e/test_coverage)](https://codeclimate.com/github/romaric1/gcp2Terraform/test_coverage) [![Join the chat at https://gitter.im/gcp2Terraform/community](https://badges.gitter.im/gcp2Terraform/community.svg)](https://gitter.im/gcp2Terraform/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![python-version](https://img.shields.io/badge/python%20version-3.6.7-green.svg)
![licence MIT](https://img.shields.io/badge/licence-MIT-lightgrey.svg)

Export existing Google Cloud Platform resources to  HashiCorp Configuration Language (HCL , Terraform)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Tested with python 3.6.7
Check your python version with :
```
python3 --version
```

### Installing

from source

```
git clone --recursive https://github.com/romaric1/gcp2Terraform.git
cd gcp2Terraform
pip install -r requirements.txt
```

from pypi

```
to complete
```
### Example

```
python ./src/import_instances.py romaric-gcp-training
```
```
python ./src/import_instances.py google-cloud-platform-project-id
```
### Output
```hcl
resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "n1-standard-2"
  zone         = "europe-west1-b"


  tags = ["http-server", "https-server", "web-server"]

  boot_disk {
    auto_delete = "True"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190116"
      size = "10"
    }
  }


  
  attached_disk {
    source = "https://www.googleapis.com/compute/v1/projects/romaric-gcp-training/zones/europe-west1-b/disks/disk-2"
    mode = "READ_WRITE"
  }
  



labels {

   env = "staging"
}

  network_interface {
    network = "default"

    access_config {
      nat_ip = "35.233.58.78"
    }
  }


service_account {
  
  email = "661701253715-compute@developer.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/trace.append"]
  
}

}
```

## Running the tests

to complete

### Break down into end to end tests

to complete
```
Give an example
```

### And coding style tests
to complete

```
Give an example
```

## Built With
to complete


## Contributing

Please read [CONTRIBUTING.md](https://github.com/romaric1/gcp2Terraform/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning
to complete

## Authors

* **TAVENARD Romaric* - *Initial work* - [romaric1](https://github.com/romaric1)

See also the list of [contributors](https://github.com/romaric1/gcp2Terraform/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

