resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial_division"
  ports {
    internal = 80
    external = 8001
  }
}