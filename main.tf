module "kind_cluster" {
  source = "./kind"
}

module "nginx" {
  source = "./nginx"
  providers = {
    helm.main = helm.main
  }
  depends_on = [
    module.kind_cluster
  ]
}

module "docker_image" {
  source = "./docker"
  providers = {
    docker.docker_desktop = docker.docker_desktop
  }
  depends_on = [
    module.kind_cluster
  ]
}

# couldn't create a module because of for_each error
# defining resources and data here
data "kustomization_build" "api" {
  path     = "./k8s/api/dev"
}

resource "kustomization_resource" "api" {
  for_each = data.kustomization_build.api.ids
  manifest = data.kustomization_build.api.manifests[each.value]

  depends_on = [
    module.kind_cluster,
    module.nginx,
    module.docker_image
  ]
}
