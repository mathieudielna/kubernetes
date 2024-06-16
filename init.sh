#!/bin/bash

# Construire les images Docker si nécessaire
# docker build -t angular-web:latest ./frontend
# docker build -t back_node:latest ./backend

# Supprimer toutes les ressources Kubernetes (commenté pour la sécurité)
# kubectl delete all --all --all-namespaces

# Appliquer les configurations Kubernetes
# kubectl apply -f ./secret.yml  # Appliquer si vous avez des secrets à déployer
kubectl apply -f ./mongodb.yml
kubectl apply -f ./angular.yml
kubectl apply -f ./node.yml
# kubectl apply -f ./ingress.yml

# Vérifier les déploiements et services
echo "---------------------------"
echo "Vérification des déploiements :"
kubectl get deployments

echo "---------------------------"
echo "Vérification des pods :"
kubectl get pods

echo "---------------------------"
echo "Vérification des services :"
kubectl get services

# kubectl port-forward service/angular-web 8080:80
# kubectl expose deployment angular-web --type=NodePort --name=angular-web
# minikube service angular-web
# kubectl get nodes -o wide