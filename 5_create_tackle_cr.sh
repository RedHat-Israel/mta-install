#!/bin/bash
cat <<EOF | oc apply -f -
kind: Tackle
apiVersion: tackle.konveyor.io/v1alpha1
metadata:
  name: mta
  namespace: openshift-mta
spec:
  hub_bucket_volume_size: "25Gi"
  maven_data_volume_size: "25Gi"
EOF

