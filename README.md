# Fedora CoreOS on Hetzner Cloud

Install [Fedora CoreOS](https://docs.fedoraproject.org/en-US/fedora-coreos/)
via [terraform](https://www.terraform.io) on Hetzner Cloud.

## What?

This is a Terraform module meant to be included in your config.

## Use

Include it in your environment config.

`main.tf`
```
module "hcloud_fcos" {
  source = "git::https://github.com/sedlund/terraform-hcloud-fcos.git?ref=v0.0.1"
  
  # Required
  hcloud_token             = "your api token here"

  # Defaults
  hcloud_server_type       = "cx21"
  hcloud_server_datacenter = "fsn1-dc14"
  hcloud_server_name       = "www1"
  ssh_public_key_name      = "My-SSH-Key"
  tools_butane_version     = "release"
  ignition_yaml            = "config.yaml" 
}
```

## Notes

An `Ignition` `config.yaml` file in the directory with your above `main.tf` is
sent to the server and processed there by `Butane`.

A 4GB VM is required to complete the initial install for the ISO and docker to
fit in memory.  After install you can use `hcloud server change-type` to reduce
the size if required.

