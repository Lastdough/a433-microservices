#!/bin/bash

# Define the directory names
backend_dir="kubernetes/backend"
frontend_dir="kubernetes/frontend"
mongodb_dir="kubernetes/mongodb"

# Create directories if they don't exist
mkdir -p $backend_dir $frontend_dir $mongodb_dir

# Backend YAML files
touch $backend_dir/karsajobs-service.yml 
touch $backend_dir/karsajobs-deployment.yml 

# Frontend YAML files
touch $frontend_dir/karsajobs-ui-service.yml  
touch $frontend_dir/karsajobs-ui-deployment.yml 

# MongoDB YAML files
touch $mongodb_dir/mongo-configmap.yml 
touch $mongodb_dir/mongo-secret.yml  
touch $mongodb_dir/mongo-pv-pvc.yml  
touch $mongodb_dir/mongo-service.yml 
touch $mongodb_dir/mongo-statefulset.yml  


echo "All Kubernetes configuration files have been created."
