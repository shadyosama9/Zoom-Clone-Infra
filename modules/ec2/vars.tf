variable "INSTANCE_TYPE" {}
variable "INSTANCE_TAGS" {
  type = map(string)
}
variable "INSTANCE_SG_ID" {}
variable "KEY_NAME" {}
variable "INSTANCE_AMI" {}
variable "VOLUME_SIZE" {}
variable "VOLUME_TYPE" {}
