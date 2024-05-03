# Construire les images Docker "si nécessaire"
# docker build -t angular-web:latest ./front
# docker build -t mathieudielna/front-kubernetes:latest .
# docker build -t api:latest ./api

# kubectl delete all --all --all-namespaces

# Appliquer les configurations Kubernetes
kubectl apply -f ./mongodb-deployment.yml
kubectl apply -f ./mongodb-service.yml
kubectl apply -f ./front-deployment.yml
kubectl apply -f ./front-service.yml  
# kubectl apply -f ./back-deployment.yml
# kubectl apply -f ./back-service.yml

# Vérifier les déploiements
kubectl get all
#kubectl get services

