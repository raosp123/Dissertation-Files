#!/bin/bash

kubectl delete -f yaml/http3-app.yaml

minikube image rm http3-tools

minikube image build -t http3-tools .

kubectl apply -f yaml/http3-app.yaml

