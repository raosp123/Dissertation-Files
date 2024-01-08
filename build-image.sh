#!/bin/bash

kubectl delete -f yaml/http3-app.yaml

minikube image rm http3-tools

minikube image build -t http3-tools .

kubectl apply -f yaml/http3-app.yaml

docker image ls | grep "<none>" | awk '{print $3 }' | xargs docker image rm # delete unused images

