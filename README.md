# OpenShift Install

The OpenShift installer `openshift-install` makes it easy to get a cluster
running on the public cloud or your local infrastructure.

To learn more about installing OpenShift, visit [docs.openshift.com](https://docs.openshift.com)
and select the version of OpenShift you are using.

## Installing OCP cluster

To install an OCP cluster (IPI) on AWS, just run:

1. If you want to install the latest version of OCP:
```
./ocp4-install.sh
```

Then, introduce the data that the installer will ask during the execution.

2. If you want to install a specific version of OCP:
```
./ocp4-install.sh 4.6
```

Then, introduce the data that the installer will ask during the execution.
