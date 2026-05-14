#!/usr/bin/env zsh
[[ $platform != mac ]] && return
function minikube_setup() {
  minikube enable efk
  minikube enable heapster
  minikube start --vm-driver=xhyve
}
