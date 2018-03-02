#!/usr/bin/env zsh

export XHYVE_EXPERIMENTAL_NFS_SHARE=true

# Function to update the DNS settings on the minikube node
function minishift_setup() {

  # Proxy is only needed if you are in the lab

  #local PROXY_SERVER=proxy.esl.cisco.com
  #local PROXY_IP=`dig +short ${PROXY_SERVER}`

  #minishift config set http-proxy http://${PROXY_IP}:80
  #minishift config set https-proxy https://${PROXY_IP}:80

  minishift start

  eval $(minishift oc-env)
  eval $(minishift docker-env)

  oc login -u system:admin

  oc adm policy add-cluster-role-to-user cluster-admin admin
  oc adm policy add-cluster-role-to-user cluster-admin developer

  #oc adm policy add-cluster-role-to-user cluster-reader system:serviceaccount:logging:fluentd

  # Allow running containers as the root user
  #
  # oc edit scc anyuid
  #
  #oc adm policy add-scc-to-user anyuid -z default -n default
  #oc adm policy add-scc-to-user anyuid -z default -n logging

  oc login -u developer -p developer


  # Set back to original values
  #minishift config unset http-proxy
  #minishift config unset https-proxy

}

alias ms_console='/usr/bin/open -a "/Applications/Google Chrome.app" $(minishift console --url)'
alias ms_kibana='/usr/bin/open -a "/Applications/Google Chrome.app" $(minishift openshift service logging-kibana -n logging --url)'
