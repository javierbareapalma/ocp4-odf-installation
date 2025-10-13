nodosworkers=$(oc get node -l node-role.kubernetes.io/worker | grep worker | awk '{print $1}')

for i in $nodosworkers; do oc label node $i cluster.ocs.openshift.io/openshift-storage=''; echo $i; done
