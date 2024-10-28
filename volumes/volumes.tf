terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}


variable "volume_name" {
  type = string
}

variable "volume_source" {
  type = string
}

resource "libvirt_volume" "vols" {
  name = "${var.volume_name}_moduled"
  source = "${var.volume_source}"
}

output "volume_id" {
  value = libvirt_volume.vols.id
}
