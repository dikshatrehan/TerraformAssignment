oci_region           = "us-ashburn-1"
tenancy_ocid         = "ocid1.tenancy.oc1..example"
user_ocid            = "ocid1.user.oc1..example"
fingerprint          = "ab:cd:ef:12:34:56:78:90:12:34:56:78:90:ab:cd:ef"
private_key_path     = "~/.oci/oci_api_key.pem"
availability_domain  = "Uocm:US-ASHBURN-AD-1"
compartment_id       = "ocid1.compartment.oc1..example"
subnet_id            = "ocid1.subnet.oc1..example"

default_ssh_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7examplekey"
additional_ssh_keys  = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7anotherkey",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7yetanotherkey"
]

ocpu_count           = 4
memory_size_in_gbs   = 32
boot_volume_size     = 30
block_volume_size    = 20