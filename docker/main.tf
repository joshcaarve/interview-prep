variable "kind_cluster_name" {
  type    = string
  default = "jke-1"
}

variable "image_name" {
  type    = string
  default = "api"
}

variable "image_tags" {
  type = list(string)
  default = [
    "api:0.0.1",
    "latest",
  ]
}

resource "docker_image" "api" {
  provider = docker.docker_desktop
  name     = var.image_name
  build {
    path = "./src/api/"
    tag  = var.image_tags
    label = {
      author : "josh"
    }
  }
}

resource "null_resource" "load_image_into_kind" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      kind load docker-image ${var.image_name} --name ${var.kind_cluster_name}
    EOF
  }

  depends_on = [docker_image.api]
}
