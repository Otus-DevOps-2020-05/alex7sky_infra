variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Default zone"
  default     = "ru-central1-a"
}
variable instance_zone {
  description = "Zone for app"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key {
  description = "ssh private key"
}
variable service_account_key_file {
  description = "Path to keyfile"
}
variable image_id {
  description = "image ID"
}
variable subnet_id {
  description = "Subnet ID"
}
variable instance_count {
  description = "Count of instances"
  default     = 1
}