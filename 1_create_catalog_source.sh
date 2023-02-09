#!/bin/bash
# iib=$1
if [ -z "$1" ]
  then
    iib=426857
    echo 'IIB was not set, using default value'
  else
    iib=$1
    echo 'IIB used: ' $iib
fi
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: CatalogSource
metadata:
  name: mta-to-upgrade
  namespace: openshift-marketplace
spec:
  displayName: MTA to upgrade
  publisher: Red Hat
  sourceType: grpc
  image: registry-proxy.engineering.redhat.com/rh-osbs/iib:$iib
EOF
