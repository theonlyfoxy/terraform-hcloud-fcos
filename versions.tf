terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud",
      version = "= 1.36.2"
    }
  }
  required_version = "= 1.4.2"
}
