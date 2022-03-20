data "kustomization_build" "argocd" {
  path     = "./dev"
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_build.argocd.ids
  manifest = data.kustomization_build.argocd.manifests[each.value]
}
// kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
// kubectl port-forward svc/argocd-server -n argocd 8080:443 //  use ingress
