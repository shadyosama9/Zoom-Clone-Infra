## Security Groups Vars

variable "ZOOM_SGs" {
  type = map(object({
    vpc_id      = string
    name        = string
    description = string

    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    tags = map(any)
  }))
}

