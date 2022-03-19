terraform {
  required_providers {

    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }

    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.9"
    }

    kustomization = {
      source  = "kbst/kustomization"
      version = "0.7.2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.3.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "docker" {
  alias = "docker_desktop"
  host  = "unix:///var/run/docker.sock"
}

provider "helm" {
  alias = "main"
  kubernetes {
    config_path = pathexpand("~/.kube/config")
  }
}


provider "kustomization" {
  alias           = "main"
  kubeconfig_path = pathexpand("~/.kube/config")
}
