output "instance_public_ip" {
  value = oci_core_instance.my_instance.public_ip
}

output "instance_shape" {
  value = local.selected_shape
}