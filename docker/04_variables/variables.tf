variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "tutorial_variables"
}

variable "container_ports" {
  description = "The ports of the container"
  type        = object({
    internal = number
    external = number
  })
  default = {
    internal = 80
    external = 8003
  }
}

variable "image_tag" {
  description = "The tag of the image"
  type        = string
}