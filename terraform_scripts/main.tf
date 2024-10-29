data "oci_core_shapes" "available_shapes" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
}

data "oci_core_images" "oracle_linux" {
  compartment_id = var.compartment_id
  operating_system = "Oracle Linux"
  operating_system_version = "7.9"  # You can specify a version or omit it for the latest
}

locals {
  selected_shape = (
    contains([for shape in data.oci_core_shapes.available_shapes.shapes : shape.shape], "VM.Standard.E4.Flex") ? 
      "VM.Standard.E4.Flex" :
      contains([for shape in data.oci_core_shapes.available_shapes.shapes : shape.shape], "VM.Standard.E5.Flex") ? 
      "VM.Standard.E5.Flex" : 
      "VM.Standard.E3.Flex"
  )
}

resource "oci_core_instance" "my_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = local.selected_shape

  shape_config {
    ocpus = var.ocpu_count
    memory_in_gbs = var.memory_size_in_gbs
  }

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.subnet_id
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.id  # Oracle Linux Image ID
  }

  metadata = {
  ssh_authorized_keys = join("\n", concat([var.default_ssh_key], var.additional_ssh_keys))
}
}

# Block Volume Resource
resource "oci_core_volume" "block_volume" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  size_in_gbs         = var.block_volume_size
}

resource "oci_core_volume_attachment" "attach_block_volume" {
  instance_id = oci_core_instance.my_instance.id
  volume_id   = oci_core_volume.block_volume.id
  attachment_type = "paravirtualized"  
}