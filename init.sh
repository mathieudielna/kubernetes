# Construire les images Docker "si nécessaire"
docker build -t front:latest ./front
docker build -t api:latest ./api

# Appliquer les configurations Kubernetes
kubectl apply -f mongodb-deployment.yaml
kubectl apply -f kmongodb-service.yaml
kubectl apply -f front-deployment.yaml
kubectl apply -f front-service.yaml
kubectl apply -f api-deployment.yaml
kubectl apply -f api-service.yaml

# Vérifier les déploiements
kubectl get all
