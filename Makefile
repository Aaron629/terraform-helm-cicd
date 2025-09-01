    .PHONY: minikube-start tf-init tf-apply tf-destroy kube-forward

    minikube-start:
	minikube start

    tf-init:
	terraform -chdir=deploy/terraform init -backend-config=envs/dev.backend.hcl

    tf-apply:
	terraform -chdir=deploy/terraform apply -auto-approve -var-file=envs/dev.tfvars

    tf-destroy:
	terraform -chdir=deploy/terraform destroy -auto-approve -var-file=envs/dev.tfvars

    kube-forward:
	kubectl -n demo port-forward svc/hello-app-app 8080:80
	@echo "Open http://localhost:8080"
