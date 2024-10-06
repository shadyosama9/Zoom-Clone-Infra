resource "aws_security_group" "Zoom-SGs" {

  for_each = var.ZOOM_SGs

  vpc_id      = each.value.vpc_id
  name        = each.value.name
  description = each.value.description

  dynamic "ingress" {
    for_each = each.value.ingress

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }
  }


  dynamic "egress" {
    for_each = each.value.egress

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks

    }
  }


  tags = each.value.tags
}