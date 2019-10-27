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
* eval $(minikube docker-env)
* docker build -t petclinic .
* minikube start
* kubectl create secret generic mysql-root --from-literal=password=petclinic@0
* kubectl create secret generic mysql-app --from-literal=username=petclinic --from-literal=password=petclinic$&
* kubectl create secret generic mysql-datasource-url --from-literal=database=petclinic --from-literal=url='jdbc:mysql://petclinic-mysql:3306/petclinic'
* kubectl get secret
* kubectl describe secrets mysql-app
* kubectl describe secrets mysql-datasource-url
* cd database
* kubectl apply -f pv.yml
* kubectl apply -f pvc.yml
* kubectl apply -f mysql-service.yml
* kubectl apply -f mysql.yml
* cd ../application
* kubectl apply -f petclinic-app.yml
* kubectl apply -f petclinic-service.yml

```