terraform {
  required_providers {
    kustomization = {
      source                = "kbst/kustomization"
      version               = "0.7.2"
      configuration_aliases = [kustomization.main]
    }
  }
  required_version = ">= 1.0.0"
}
