# Kubernetes 

## Introduction 
Petit résumé de l'infrastructure utilisée au coeur du projet : 
* `/k8s/mongoDB :` configuration kubernetes de la base de donnée utilisé
* `./k8s/backend :` config kubernetes application backend - tous les paramètres sont accessible via le fichier de 
    * `node-deployment` : toute la configuration nécéssaire est disponible via le fichier suivant seul paramètre à changer :
        * `url de connexion mongoDB` : modifier avec url ingress si configuré || ou faire pointer sur l'url du pods mongoDB
* `./k8s/frontend :` config kubernetes application frontend. 
    * **Attention :** l'url de connexion via variable d'environement ne fonctionne pas. Il faut modifier le fichier d'environement présent dans l'app frontend et faire pointer vers **l'url ingress ou url du backend en direct.**
    Accessible via : `./frontend/src/shared/env/` : 
        * `env.prod :` modifier **apiBaseUrl**     
    ```sh
    # ensuite executer les commmandes : 
    docker build -t angular-web:latest ./frontend 
    # soit déployer et mettre à jour le fichier 
    # /k8s/frontend 
    ```

***Attention de faire attention à votre pare-feu lors de l'utilisation du ingress*** 

## Lancement de l'application parefeu 


### Via IP PODS
```sh
kubectl apply -f ./k8s/mongodb 
kubectl get pods -o wide -l app=mongo 
# modifier l'url dans la config backend puis : 
kubectl apply -f ./k8s/backend 
# changer l'url d'env angular puis build la nouvelle image frontend
kubectl apply -f ./k8s/frontend 
kubectl port-forward service/angular-web 8080:80 
# login - les valeurs par défaut sont déja renseigné vous pourrez vous login puis voir les valeurs insérées par défaut 
```

### Via ingress - Attention à votre parefeu
utilisé les url suivantes 
* `frontend`: `angular-service.default.svc.cluster.local` || `http://frontend.local`
* `backend`: `backend-service.default.svc.cluster.local` || `http://backend.local`

```sh 
kubectl apply -f ./k8s/mongodb 

# modifier l'url dans la config backend puis : 
kubectl apply -f ./k8s/backend 
# changer l'url d'env angular puis build la nouvelle image frontend
kubectl apply -f ./k8s/frontend 
# login - les valeurs par défaut sont déja renseigné vous pourrez vous login puis voir les valeurs insérées par défaut 
```

## Personal notes 
```sh
minikube status
minikube start

Verify API Server Access: Use kubectl to verify that you can access the Kubernetes API server. Simple commands like the following can confirm this:
kubectl get nodes
kubectl cluster-info

Check Configuration and Contexts: Your kubectl configuration might be pointing to the wrong context or a cluster that isn't currently running. Check your configuration with:
kubectl config view

And list your contexts to make sure you're connected to the correct one:
kubectl config get-contexts


You can switch to the correct context using:
kubectl config use-context [context-name]

Review Logs and Services: If you have access to the cluster but services are not responding as expected, check the logs for your Kubernetes components. For example, if you're running Kubernetes via Minikube, you might find useful logs with:
minikube logs

docker logs [container-id-of-kubernetes-component]


kubectl apply -f front-deployment.yaml --validate=false
kubectl apply -f front-service.yaml --validate=false


kubectl get pods -w


kubectl delete all --all --all-namespaces

kubectl delete pod --selector=app=front

kubectl logs pods_id

docker tag back_node  mathieudielna/node-template:tagname
docker push mathieudielna/front-kubernetes:latest      

 kubectl describe service front-service

 kubectl describe pod  


 minikube ip
kubectl get nodes -o wide 
kubectl get service front-service 

kubectl get ingress X

minikube service front-service

minikube tunnel
minikube dashboard

kubectl create deployment front --image=mathieudielna/front-kubernetes:latest

kubectl port-forward front-deployment-67bc598f8f-f9vvw  8080:80 

echo -n 'info' | base64

kubectl exec -it backend-deployment-7c57f957f7-vjm4p   -- /bin/sh
```
