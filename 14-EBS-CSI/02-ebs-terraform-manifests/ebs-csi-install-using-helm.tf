# Install EBS CSI Driver using Helm
# Resource: Helm Release
resource "helm_release" "ebs_csi_driver" {
  depends_on = [ aws_iam_role.ebs_csi_iam_role ]
  name       = "${local.name}-aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace = "kube-system"

  set = [ 
    {
    name = "image.repository"
    value = "602401143452.dkr.ecr.ap-northeast-1.amazonaws.com/eks/aws-ebs-csi-driver"
    },

    {
    name  = "controller.serviceAccount.create"
    value = "true"
    },

    {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
    },

    {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.ebs_csi_iam_role.arn}"
    }
  ]
}