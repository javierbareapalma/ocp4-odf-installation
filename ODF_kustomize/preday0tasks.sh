nodosodfworkers=$(oc get node -l node-role.kubernetes.io/worker | grep worker | awk '{print $1}')

# Label the nodes for ODF storage purpose
for i in $nodosodfworkers; do oc label node $i  cluster.ocs.openshift.io/openshift-storage=''; echo $i; done

# Assign the ODF nodes to infra role
#for i in $nodosodfworkers; do oc label node $i  node-role.kubernetes.io/infra=""; done

# Taint the ODF nodes to ensure they are aimed for exclusively for storage, preventing other workloads from being scheduled on them
#for i in $nodosodfworkers; do oc adm taint node $i  node.ocs.openshift.io/storage="true":NoSchedule; done
