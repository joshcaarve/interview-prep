# interview-prep

## Deploy Kind using Terraform

```
$ cd terraform/kind
$ terraform init
$ terraform apply --auto-approve
```

## Deploy nginx-ingress helm chart via Terraform

```
$ cd terraform/nginx
$ terraform init
$ terraform apply --auto-approve
```

## Build Docker Image

```
$ cd/src/api
$ export IMAGE_NAME='api:0.0.1'
$ docker build -t $IMAGE_NAME . --no-cache
```

## Load Docker Image into Kind

```
$ kind load docker-image $IMAGE_NAME --name jke-1
```

## Build K8s Manifest using Kustomize and Apply to Kind Cluster

```
$ cd k8s/api
$ kustomize build dev > dev.yaml
$ kubectl apply -f dev.yaml
```

## Haproxy

```
haproxy -f tcp.cfg
```
