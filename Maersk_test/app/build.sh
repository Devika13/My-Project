#!/bin/bash
##Preparing build environment
minikube start --driver=docker

##building docker image
docker build -t flask-app .


##deploying application  
kubectl create -f .
