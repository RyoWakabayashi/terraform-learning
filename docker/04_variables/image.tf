resource "docker_image" "nginx" {
  name         = "nginx:${var.image_tag}"
  keep_locally = false
}
