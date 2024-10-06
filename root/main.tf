module "sg" {
  source = "../modules/security-groups"

  ZOOM_SGs = var.ZOOM_SGs
}



module "ec2-scraper" {

  source = "../modules/ec2"

  INSTANCE_TYPE  = "t2.large"
  INSTANCE_AMI   = "ami-0866a3c8686eaeeba"
  INSTANCE_SG_ID = lookup(module.sg.Security-Groups-IDs, "jenkins-sg")
  KEY_NAME       = "Jenkins-Key"
  INSTANCE_TAGS = {
    "Name" = "Jenkins-Server"
  }
  VOLUME_TYPE = "gp2"
  VOLUME_SIZE = 20
}