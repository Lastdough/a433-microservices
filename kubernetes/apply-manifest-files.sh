#!/bin/bash

# Stop the script if any command fails
set -e

# Apply RabbitMQ Secret
echo "Applying RabbitMQ Secret..."
kubectl apply -f rabbitmq-secret.yaml

# Apply Order Service Deployment and Service
echo "Applying Order Service Deployment and Service..."
kubectl apply -f order-service/order-service-deployment.yaml
kubectl apply -f order-service/order-service.yaml

kubectl apply -f order-service/order-service-gateway.yaml
kubectl apply -f order-service/order-service-virtualservice.yaml

# Apply Shipping Service Deployment and Service
echo "Applying Shipping Service Deployment and Service..."
kubectl apply -f shipping-service/shipping-service-deployment.yaml
kubectl apply -f shipping-service/shipping-service.yaml

kubectl apply -f shipping-service/shipping-service-gateway.yaml
kubectl apply -f shipping-service/shipping-service-virtualservice.yaml

echo "All Ship and Order manifests have been applied successfully."

echo ""
echo "Pod :"
kubectl get po

echo ""
echo "Service:"
kubectl get svc
