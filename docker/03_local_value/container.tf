resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = local.container_name

  ports {
    internal = local.container_ports.internal
    external = local.container_ports.external
  }
}