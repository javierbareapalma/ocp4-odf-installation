oc apply -f ./odf416/namespace.yml
echo "if u have 1 seconds to spare.."
sleep 1
oc apply -f ./odf416/operator.yml
echo "if u have 2 seconds to spare.."
sleep 2
oc apply -f ./odf416/subscription.yml
echo "if u have 8 seconds to spare.."
sleep 8
oc apply -f ./odf416/storagesystem.yml
echo "if u have 2 seconds to spare.."
sleep 2
oc apply -f ./odf416/storagecluster.yml
