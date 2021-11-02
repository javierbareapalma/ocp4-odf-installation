# OpenShift Install

The OpenShift installer `openshift-install` makes it easy to get a cluster
running on the public cloud or your local infrastructure.

To learn more about installing OpenShift, visit [docs.openshift.com](https://docs.openshift.com)
and select the version of OpenShift you are using.

## Installing the tools

After extracting this archive, you can move the `openshift-install` binary
to a location on your PATH such as `/usr/local/bin`, or keep it in a temporary
directory and reference it via `./openshift-install`.

# Installing an OCP cluster
Some folders/files must exist in this repository:
- [oauth/](./oauth/): Set the oauth as htpasswd provider. Some users are created, and the _kubeadmin_ user is removed.
- [oauth.sh](./oauth.sh): The script that configures the htpasswd provider.
- [ocp4-install.sh](ocp4-install.sh): Main script.

For installing an OCP v4.X cluster on AWS (IPI), just run:
```
./ocp4-install.sh
```

This script will fetch the installer and will ask you for some information that it needs to create the OCP cluster. Finally, the _openshift-install_ is executed.


## License

OpenShift is licensed under the Apache Public License 2.0. The source code for this
program is [located on github](https://github.com/openshift/installer).
