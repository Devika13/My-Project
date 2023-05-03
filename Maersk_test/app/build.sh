#!/bin/bash
##Preparing build environment
minikube start --driver=docker
eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)



##building docker image
docker build -t flask-app .


##deploying application  
kubectl create -f .
