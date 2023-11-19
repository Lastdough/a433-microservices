#!/bin/bash

# Stop execution if an error occurs
set -e

# Delete Backend Configurations
echo "Deleting backend configurations..."
kubectl delete -f kubernetes/backend/karsajobs-service.yml
kubectl delete -f kubernetes/backend/karsajobs-deployment.yml

# Delete Frontend Configurations
echo "Deleting frontend configurations..."
kubectl delete -f kubernetes/frontend/karsajobs-ui-service.yml
kubectl delete -f kubernetes/frontend/karsajobs-ui-deployment.yml

# Delete MongoDB Configurations
echo "Deleting MongoDB configurations..."
kubectl delete -f kubernetes/mongodb/mongo-configmap.yml
kubectl delete -f kubernetes/mongodb/mongo-secret.yml
kubectl delete -f kubernetes/mongodb/mongo-pv-pvc.yml
kubectl delete -f kubernetes/mongodb/mongo-service.yml
kubectl delete -f kubernetes/mongodb/mongo-statefulset.yml

echo "Kubernetes configurations deleted successfully."
