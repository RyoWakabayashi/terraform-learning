resource "docker_image" "nginx" {
  name         = "nginx:${local.image_tag}"
  keep_locally = false
}
