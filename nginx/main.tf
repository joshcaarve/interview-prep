variable "cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "ingress_nginx_namespace" {
  type        = string
  description = "The nginx ingress namespace (it will be created if needed)."
  default     = "ingress-nginx"
}

variable "chart_version" {
  type = string
  default = "4.0.6"
}

resource "helm_release" "ingress_nginx" {
  provider   = helm.main
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  namespace        = var.ingress_nginx_namespace
  create_namespace = true

  values = [file("./nginx/nginx-ingress.yaml")]
}

resource "null_resource" "wait_for_ingress_nginx" {
  triggers = {
    ingress_nginx = join(",", [var.chart_version])
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the nginx ingress controller...\n"
      kubectl wait --namespace ${helm_release.ingress_nginx.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=90s
    EOF
  }
  depends_on = [helm_release.ingress_nginx]
}
