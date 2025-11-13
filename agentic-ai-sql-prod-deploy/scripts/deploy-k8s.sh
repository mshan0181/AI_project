#!/bin/bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/secrets.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/clusterissuer-staging.yaml
kubectl apply -f k8s/mcp-deployment.yaml
kubectl apply -f k8s/gradio-deployment.yaml
kubectl apply -f k8s/mcp-hpa.yaml
kubectl apply -f k8s/gradio-hpa.yaml
kubectl apply -f k8s/ingress.yaml
