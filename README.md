# Readme config 

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

docker tag front  mathieudielna/front-kubernetes:latest
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