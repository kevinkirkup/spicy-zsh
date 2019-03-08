#!/usr/bin/env zsh

# Function to update the DNS settings on the minikube node
function minikube_setup() {

  minikube enable efk
  minikube enable heapster
  minikube start --vm-driver=xhyve

}
