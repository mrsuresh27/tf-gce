variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy the VM in"
  type        = string
  default     = "us-central1-a"
}

variable "network_name" {
  description = "Name of the custom VPC network"
  type        = string
  default     = "custom-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "custom-subnet"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "terraform-instance"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Image for the VM boot disk"
  type        = string
  default     = "debian-cloud/debian-11"
}
