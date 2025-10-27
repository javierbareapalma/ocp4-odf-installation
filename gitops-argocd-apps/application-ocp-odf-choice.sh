#!/usr/bin/env bash
# A simple script that accepts one argument: 4.16, 4.17, 4.18 or 4.19.

# Check that exactly one argument was provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 {4.16|4.17|4.18|4.19}"
  exit 1
fi

## Label the nodes for ODF storage purpose
#echo "Labeling nodes to be used for ODF storage purpose.."
#nodosodfworkers=$(oc get node -l node-role.kubernetes.io/worker | grep worker | awk '{print $1}')
#for i in $nodosodfworkers; do oc label node $i  cluster.ocs.openshift.io/openshift-storage=''; echo $i; done

# Check the argument value
case "$1" in
  4.16)
    echo "You chose option 4.16."
    oc apply -f application-ocp-odf416.yaml
    ;;
  4.17)
    echo "You chose option 4.17."
    oc apply -f application-ocp-odf417.yaml
    ;;
  4.18)
    echo "You chose option 4.18."
    oc apply -f application-ocp-odf418.yaml
    ;;
  4.19)
    echo "You chose option 4.19."
    oc apply -f application-ocp-odf419.yaml
    ;;
  *)
    echo "Invalid option: $1"
    echo "Usage: $0 {4.16|4.17|4.18|4.19}"
    exit 1
    ;;
esac
