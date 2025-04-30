variable "project_id" {
  description = "The GCP project ID where the VM will be created."
  type        = string
}

variable "region" {
  description = "The GCP region where the VM will be created."
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM will be created."
  type        = string
}

variable "credentials_file" {
  description = "The path to your GCP service account JSON credentials file."
  type        = string
}
