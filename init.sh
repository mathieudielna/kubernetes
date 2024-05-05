# Construire les images Docker "si nécessaire"
# docker build -t angular-web:latest ./front
# docker build -t mathieudielna/front-kubernetes:latest .
# docker build -t api:latest ./api

# Supprimer toutes les ressources Kubernetes, si nécessaire (commenté pour la sécurité)
# kubectl delete all --all --all-namespaces

# Appliquer les configurations Kubernetes
kubectl apply -f ./secret.yml  # Appliquer le fichier de secrets en premier
kubectl apply -f ./mongodb.yml
kubectl apply -f ./angular.yml
kubectl apply -f ./node.yml


# Vérifier les déploiements et services
kubectl get all
kubectl get services
