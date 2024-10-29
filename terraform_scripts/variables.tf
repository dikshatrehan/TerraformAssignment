variable "oci_region" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "availability_domain" {}
variable "compartment_id" {}
variable "subnet_id" {}
variable "default_ssh_key" { type = string }
variable "additional_ssh_keys" { type = list(string) }

variable "ocpu_count" { default = 4 }
variable "memory_size_in_gbs" { default = 32 }
variable "boot_volume_size" { default = 30 }
variable "block_volume_size" { default = 20 }