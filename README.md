# Terraform × Helm × CI/CD - Minimal Demo

這是一個 **最小化** 的專案，用 Terraform 直接安裝本倉庫內的 Helm Chart，
在本機 **Minikube** 上部署一個 `nginxdemos/hello` 的 HTTP 服務。

## 先決條件
- Terraform >= 1.5
- kubectl、helm
- 本機已安裝 minikube（預設使用 `minikube` context）

## 快速開始
```bash
# 1) 啟動 minikube（如尚未啟動）
make minikube-start

# 2) 初始化 Terraform（使用本地 backend）
make tf-init

# 3) 佈署（會建立 namespace=demo，release=hello-app）
make tf-apply

# 4) 轉送服務到本機 8080
make kube-forward
# 瀏覽：http://localhost:8080
```

## 清除
```bash
make tf-destroy
```

> 備註：`src/app.py` 僅作為 FastAPI 範例檔，實際部署使用的是公開鏡像 `nginxdemos/hello`，
目的在於 **免建鏡像**、**秒級驗證 Terraform × Helm 流程**。
test cicd
