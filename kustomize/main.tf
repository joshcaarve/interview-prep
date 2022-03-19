data "kustomization_build" "api_dev" {
  provider = kustomization.main
  path     = "./k8s/api/dev"
}

resource "kustomization_resource" "api_dev" {
  provider = kustomization.main

  for_each = data.kustomization_build.api_dev.ids
  manifest = data.kustomization_build.api_dev.manifests[each.value]
}


