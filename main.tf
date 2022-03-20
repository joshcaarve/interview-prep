module "kind_cluster" {
  source = "./modules/kind"
}

module "nginx" {
  source = "./modules/nginx"
  providers = {
    helm.main = helm.main
  }
  depends_on = [
    module.kind_cluster
  ]
}

/*
module certs {
  source = "./certs"
  
}
*/

module "docker_image" {
  source = "./modules/docker"
  providers = {
    docker.docker_desktop = docker.docker_desktop
  }
  depends_on = [
    module.kind_cluster
  ]
}
