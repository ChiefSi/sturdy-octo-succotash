terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

locals {
  vols = {
    simon1 = {
      name = "hello"
      source = "hello.qcow2"
    },
    simon2 = {
      name = "there"
      source = "there.qcow2"
    }
  }
}

module "volumes" {
  for_each = { for k, v in local.vols: k => v }
  source = "./volumes"
  volume_name = "${each.value.name}_v1"
  volume_source = "${each.value.source}"
}

resource "libvirt_volume" "v1" {
  name = "example"
  base_volume_id = "${module.volumes["simon1"].volume_id}"
}



