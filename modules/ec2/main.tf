resource "aws_instance" "Zoom_Instances" {

  instance_type          = var.INSTANCE_TYPE
  ami                    = var.INSTANCE_AMI
  key_name               = var.KEY_NAME
  vpc_security_group_ids = [var.INSTANCE_SG_ID]
  availability_zone      = "us-east-1c"
  tags                   = var.INSTANCE_TAGS
  root_block_device {
    volume_type           = var.VOLUME_TYPE
    volume_size           = var.VOLUME_SIZE
    delete_on_termination = true
  }
}