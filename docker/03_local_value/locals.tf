locals {
  image_tag = "latest"

  container_name = "tutorial_local_value"

  container_ports = {
    internal = 80
    external = 8002
  }
}