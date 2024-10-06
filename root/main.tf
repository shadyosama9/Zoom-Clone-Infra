module "sg" {
  source = "../modules/security-groups"

  ZOOM_SGs = var.ZOOM_SGs
}