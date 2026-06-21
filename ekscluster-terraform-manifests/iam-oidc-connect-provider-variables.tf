# Input Variables - AWS IAM OpenID Connect Provider
variable "eks_oidc_root_ca_thumbprint" {
  description = "Thumbprint of Root CA for EKS OIDC"
  type = string
  default = "06B25927C42A721631CFEFD9431E648FA62E1E39"
}