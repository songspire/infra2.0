
module "main" {
    source = "../modules/main"
    project_id = var.project_id
    region = var.region
    zone = var.zone
    env = local.env
}