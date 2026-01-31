terraform {
  backend "gcs" {
    bucket = "hip-runner-terraform-statefile" # Change this to your unique bucket name
    prefix = "terraform/gce"
  }
}
