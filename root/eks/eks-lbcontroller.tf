data "aws_caller_identity" "current" {}

resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  namespace  = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.7.2"

  set {
    name  = "clusterName"
    value = module.eks.cluster_name
  }

  set {
    name  = "defaultTargetType"
    value = "ip"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = aws_iam_role.aws_load_balancer_controller.id
  }
  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com\\/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }
}