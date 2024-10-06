output "Security-Groups-IDs" {
  value = { for key, sg in aws_security_group.Zoom-SGs : key => sg.id }
}