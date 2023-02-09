#!/bin/bash
approval=$1
cat <<EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: mta-operator
  namespace: openshift-mta
spec:
  channel: stable-v6.0
  installPlanApproval: $approval
  name: mta-operator
  source: mta-to-upgrade
  sourceNamespace: openshift-marketplace
  startingCSV: mta-operator.v6.0.0
EOF
