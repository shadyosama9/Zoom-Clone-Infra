variable "REGION" {}


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



## EC2 Vars

# variable "ZOOM_INSTANCE" {
#   type = map(object({
#     instance-type = string
#     ami = string
#     key-name = string
#     security-groups = list(string)
#     zone = string
#     tags = map(any)

#     root_block_device = object({
#       volume_type = string 
#       volume_size = number
#       delete_on_termination = bool
#     })

#   }))
# }


