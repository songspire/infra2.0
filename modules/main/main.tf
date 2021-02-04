variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "env" {}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.0"

    project_id   = var.project_id
    network_name = var.env

    subnets = [
        {
            subnet_name = "public-jump"
            subnet_ip = "10.0.1.0/24"
            subnet_region = var.region
        }

    ]
}

# module "startup-script-lib" {
#   source = "git::https://github.com/terraform-google-modules/terraform-google-startup-scripts.git?ref=v0.1.0"
# }

# resource "google_compute_instance" "jump" {
#   allow_stopping_for_update = true
#   name         = "jump"
#   machine_type = "e2-small"
#   zone         = var.zone

#   tags = ["jump"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-10"
#     }
#   }

#   // Local SSD disk
#   # scratch_disk {
#   #   interface = "SCSI"
#   # }

#   network_interface {
#     network    = module.vpc.network_name
#     subnetwork = element(module.vpc.subnets_names, 0)

#     access_config {
#       // Ephemeral IP
#     }
#   }

# #   metadata_startup_script = file("bootstrap.sh")

#   service_account {
#     scopes = ["userinfo-email", "compute-rw", "storage-rw"]
#   }
# }

# resource "google_compute_firewall" "jump" {
#   name    = "jump"
#   network = module.vpc.network_name

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

# #   source_ranges = ["8.8.8.8/32"]
#   target_tags   = ["jump"]
# }


