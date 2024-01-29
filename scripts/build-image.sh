#!/bin/bash

set -euo pipefail

kubectl delete -f yamls

sleep 5

minikube image rm http3-tools

minikube image build -t http3-tools .

kubectl apply -f yamls


OLD_CONTAINERS=$(docker image ls | grep "<none>")

NUM_CONTAINER=$( ${OLD_CONTAINERS} | wc -l )

if [[ -n "${OLD_CONTAINERS}" ]]; then

        read -p "Do you want to clean up ${NUM_CONTAINER} unused images y/n? " -n 1 -r
        if [[ ! $REPLY =~ ^[Yy]$ ]] ; then
            exit 1
        fi
        
        echo -e "deleting $( ${OLD_CONTAINERS} | awk '{print $1}' ) \n\n"
        echo "${OLD_CONTAINERS}" | awk '{print $3}'| xargs docker image rm  # delete unused images
    else
        echo "No <none> type images to clean up"
fi