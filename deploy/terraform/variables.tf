# 供 providers.tf 使用（KinD 方案：workflow 以 -var 傳入）
variable "kubeconfig_path" { type = string }
variable "kube_context"    { type = string }

# 你的 release 與命名空間
variable "namespace" { type = string }
variable "app_name"  { type = string }

# 用於選擇 values.<env>.yaml
variable "env" {
  type    = string
  default = "dev"
}