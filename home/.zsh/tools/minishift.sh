#!/usr/bin/env zsh
[[ $platform != mac ]] && return
export XHYVE_EXPERIMENTAL_NFS_SHARE=true
function minishift_setup() {
  minishift start
  eval $(minishift oc-env)
  eval $(minishift docker-env)
  oc login -u system:admin
  oc adm policy add-cluster-role-to-user cluster-admin admin
  oc adm policy add-cluster-role-to-user cluster-admin developer
  oc login -u developer -p developer
}
alias ms_console='/usr/bin/open -a "/Applications/Google Chrome.app" $(minishift console --url)'
alias ms_kibana='/usr/bin/open -a "/Applications/Google Chrome.app" $(minishift openshift service logging-kibana -n logging --url)'
