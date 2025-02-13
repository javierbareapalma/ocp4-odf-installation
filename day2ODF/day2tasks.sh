echo "oc -n openshift-storage scale deploy rook-ceph-rgw-ocs-storagecluster-cephobjectstore-a --replicas=2"
oc -n openshift-storage scale deploy rook-ceph-rgw-ocs-storagecluster-cephobjectstore-a --replicas=2
echo "if u have 2 seconds to spare.."
echo "oc -n openshift-storage scale deploy noobaa-endpoint --replicas=2"
oc -n openshift-storage scale deploy noobaa-endpoint --replicas=2
echo "if u have 2 seconds to spare.."
