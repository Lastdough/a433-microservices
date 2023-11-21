#!/bin/bash

# Stop the script if any command fails
set -e

# Delete Order Service Deployment and Service
echo "Deleting Order Service Deployment and Service..."
kubectl delete -f order-service/order-service-deployment.yaml
kubectl delete -f order-service/order-service.yaml

kubectl delete -f order-service/order-service-gateway.yaml
kubectl delete -f order-service/order-service-virtualservice.yaml

# Delete Shipping Service Deployment and Service
echo "Deleting Shipping Service Deployment and Service..."
kubectl delete -f shipping-service/shipping-service-deployment.yaml
kubectl delete -f shipping-service/shipping-service.yaml

kubectl apply -f shipping-service/shipping-service-gateway.yaml
kubectl apply -f shipping-service/shipping-service-virtualservice.yaml

# Delete RabbitMQ Secret
echo "Deleting RabbitMQ Secret..."
kubectl delete -f rabbitmq-secret.yaml

echo "All Order and Ship Kubernetes resources have been deleted successfully."

echo ""
echo "Pod :"
kubectl get po

echo ""
echo "Service:"
kubectl get svc
