# Fedora CoreOS on Hetzner Cloud

A Terraform module to install [Fedora CoreOS](https://docs.fedoraproject.org/en-US/fedora-coreos/)
via [terraform](https://www.terraform.io) on Hetzner Cloud.

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

A VM with at least 4GB is required to complete the install for the CoreOS image
and docker to fit in memory.  After install you can use `hcloud server
change-type` to reduce the size if required.

