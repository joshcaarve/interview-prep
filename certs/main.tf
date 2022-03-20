/*
resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}
*/

data "kustomization_build" "cert_manager" {
  path     = "./"
}

resource "kustomization_resource" "cert_manager" {
  for_each = data.kustomization_build.cert_manager.ids
  manifest = data.kustomization_build.cert_manager.manifests[each.value]
  /*
  depends_on = [
    kubernetes_namespace.cert_manager
  ]
  */
}

resource "null_resource" "wait_for_running" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the cert-manager controller...\n"
      kubectl wait --namespace cert-manager \
        --for=condition=ready pod \
        --timeout=90s
    EOF
  }
  depends_on = [
    kustomization_resource.cert_manager
  ]
}

data "kustomization_build" "cert_manager_addons" {
  path     = "./dev"
  depends_on = [
    null_resource.wait_for_running
  ]
}

resource "kustomization_resource" "cert_manager_addons" {
  for_each = data.kustomization_build.cert_manager.ids
  manifest = data.kustomization_build.cert_manager.manifests[each.value]

  depends_on = [
    null_resource.wait_for_running
  ]
}
