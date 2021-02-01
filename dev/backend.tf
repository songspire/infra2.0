terraform {
  backend "gcs" {
    bucket = "tmp1-271812-tfstate"
    prefix = "dev"
  }
}
