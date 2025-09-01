# 建立 Namespace（Helm 不再自建）
resource "kubernetes_namespace" "ns" {
  metadata { name = var.namespace }
}

# 使用本倉庫內的 Helm Chart
resource "helm_release" "app" {
  name      = var.app_name
  namespace = kubernetes_namespace.ns.metadata[0].name
  chart     = "${path.module}/../../charts/app"

  # 覆寫values，可依 env 切換（例如 values.dev.yaml）
  values = [
    file("${path.module}/../../charts/app/values.yaml"),
    file("${path.module}/../../charts/app/values.${var.env}.yaml")
  ]

  # 佈署穩定性
  wait            = true # 等待所有資源 ready
  atomic          = true # 失敗自動回滾
  cleanup_on_fail = true # 失敗清理暫存資源
  # 若 chart 名稱有改動，開啟替換（需要時再用）
  replace = true
}
