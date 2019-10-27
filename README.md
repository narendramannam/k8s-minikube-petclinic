# k8s-minikube-petclinic

## Requirement
Take a simple java based web application which connects to MySQL database and returns the page when loaded, main focus is to containerize the application using docker and deploy the same into minikube k8s environment

## Techstack used
* Java - Application logic
* MySQL - Database
* Docker - Container technology
* Minikube - Local kubernetes environment 
* Helm - Manifest template engine

## Steps to follow, to build docker image, create secrets and deploy application & database
```
Build docker image and make it available to minikube environment:
    * eval $(minikube docker-env)
    * docker build -t petclinic .
Setup minikube environment and dashboard:
    * minikube start
    * minikube dashboard - run this in different terminal
Setup database secrets:
    * kubectl create secret generic mysql-root --from-literal=password=petclinic@0
    * kubectl create secret generic mysql-app --from-literal=username=petclinic --from-literal=password=petclinic$&
    * kubectl create secret generic mysql-datasource-url --from-literal=database=petclinic --from-literal=url='jdbc:mysql://petclinic-mysql:3306/petclinic'
    * kubectl get secret
    * kubectl describe secrets mysql-app
    * kubectl describe secrets mysql-datasource-url
Setup databse:
    * kubectl apply -f database/pv.yml
    * kubectl apply -f database/pvc.yml
    * kubectl apply -f database/mysql-service.yml
    * kubectl apply -f database/mysql.yml
Setup application using manifest directly:
    * kubectl apply -f application/petclinic-app.yml
    * kubectl apply -f application/petclinic-service.yml
Setup application using Helm charts:
    * helm install --name petclinic ./petclinic-app
Get service endpoint:
    * minikube service petclinic --url - this returns an k8s service endpoint to access the application outside k8s environment
More useful commands:
    * kubectl get all - to get all the k8s resources created like, service, deployment, replicaset, and pods
    * kubectl get pods - to list the pods deployed to k8s environment
    * kubectl logs podname - to see the logs of a pod, usefull for debugging
```