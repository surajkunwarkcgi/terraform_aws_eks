#Kubernetes LoadBalancer Service NLB
resource "kubernetes_service_v1" "lb_service_nlb" {
  metadata {
    name = "myapp1-nlb"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"    #To create a Network Load Balancer
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.myapp1.spec.0.selector.0.match_labels.app
    }
    port {
      name = "http"
      port = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}