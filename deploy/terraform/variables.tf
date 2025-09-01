variable "namespace" {
  type        = string
  description = "Kubernetes namespace"
  default     = "demo"
}

variable "app_name" {
  type        = string
  description = "Release / app name"
  default     = "hello-app"
}

variable "kubeconfig_path" {
  type        = string
  description = "Path to kubeconfig"
  default     = "~/.kube/config"
}

variable "kube_context" {
  type        = string
  description = "Kube context (minikube for local demo)"
  default     = "minikube"
}

variable "env" {
  type        = string
  description = "Environment name to pick helm values (dev)"
  default     = "dev"
}
