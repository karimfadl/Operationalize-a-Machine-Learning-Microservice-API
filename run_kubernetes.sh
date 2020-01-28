#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="karimfadl/udacity-mlapi"
k8s_deployment="mlmicroserviceapi"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $k8s_deployment --image=$dockerpath --port=80 --labels app=$k8s_deployment

# Step 3:
# List kubernetes pods
kubectl get deployment

# Step 4:
# Forward the container port to a host
kubectl expose deployment $k8s_deployment --type=LoadBalancer --port=80
minikube service mlmicroserviceapi
