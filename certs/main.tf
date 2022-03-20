resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}

data "kustomization_build" "cert_manager" {
  path     = "./dev"
}

resource "kustomization_resource" "cert_manager" {
  for_each = data.kustomization_build.cert_manager.ids
  manifest = data.kustomization_build.cert_manager.manifests[each.value]
  depends_on = [
    kubernetes_namespace.cert_manager
  ]
}
