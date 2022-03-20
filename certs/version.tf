terraform {
  required_providers {
    kustomization = {
      source                = "kbst/kustomization"
      version               = "0.7.2"
      //configuration_aliases = [kustomization.main]
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "kustomization" {
  //alias           = "main"
  kubeconfig_path = pathexpand("~/.kube/config")
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}
