variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "env" {}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    # version = "0.6.0"

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