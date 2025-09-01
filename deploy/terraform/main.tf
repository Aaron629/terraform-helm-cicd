resource "kubernetes_namespace" "ns" {
  metadata { name = var.namespace }
}

# 直接使用本倉庫內的 Helm Chart
resource "helm_release" "app" {
  name       = var.app_name
  namespace  = kubernetes_namespace.ns.metadata[0].name
  chart      = "${path.module}/../../charts/app"

  # 覆寫 values，可依 env 切換
  values = [
    file("${path.module}/../../charts/app/values.yaml"),
    file("${path.module}/../../charts/app/values.${var.env}.yaml")
  ]

  # 若 chart 名稱有改動，開啟替換
  replace = true
}
