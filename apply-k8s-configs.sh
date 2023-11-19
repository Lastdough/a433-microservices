#!/bin/bash

# Stop execution if an error occurs
set -e

# Apply Backend Configurations
echo "Applying backend configurations..."
kubectl apply -f kubernetes/backend/karsajobs-service.yml
kubectl apply -f kubernetes/backend/karsajobs-deployment.yml

# Apply Frontend Configurations
echo "Applying frontend configurations..."
kubectl apply -f kubernetes/frontend/karsajobs-ui-service.yml
kubectl apply -f kubernetes/frontend/karsajobs-ui-deployment.yml

# Apply MongoDB Configurations
echo "Applying MongoDB configurations..."
kubectl apply -f kubernetes/mongodb/mongo-configmap.yml
kubectl apply -f kubernetes/mongodb/mongo-secret.yml
kubectl apply -f kubernetes/mongodb/mongo-pv-pvc.yml
kubectl apply -f kubernetes/mongodb/mongo-service.yml
kubectl apply -f kubernetes/mongodb/mongo-statefulset.yml

echo "Kubernetes configurations applied successfully."