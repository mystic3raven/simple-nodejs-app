provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "nodejs_app" {
  metadata {
    name = "nodejs-app"
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "nodejs-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "nodejs-app"
        }
      }
      spec {
        container {
          image = var.container_image
          name  = "nodejs-app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nodejs_app" {
  metadata {
    name = "nodejs-app-service"
  }
  spec {
    selector = {
      app = "nodejs-app"
    }
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
