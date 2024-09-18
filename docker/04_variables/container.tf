resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  ports {
    internal = var.container_ports.internal
    external = var.container_ports.external
  }
}