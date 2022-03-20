terraform {
  required_providers {

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }

    helm = {
      source                = "hashicorp/helm"
      version               = "2.3.0"
      configuration_aliases = [helm.main]
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.0.0"
}
