#!/bin/bash

# Create a directory for Kubernetes manifests 

touch order-service/order-service-deployment.yaml
touch order-service/order-service.yaml
touch order-service/order-service-gateway.yaml
touch order-service/order-service-virtualservice.yaml

touch shipping-service/shipping-service-deployment.yaml
touch shipping-service/shipping-service.yaml
touch shipping-service/shipping-service-gateway.yaml 
touch shipping-service/shipping-service-virtualservice.yaml 

echo "Kubernetes manifest files have been created in the k8s-manifests directory."
