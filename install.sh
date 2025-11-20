#!/bin/bash
./1_create_catalog_source.sh $1
./2_create_namespace.sh
./3_create_operator_group.sh
./4_create_subscription.sh Manual
# sleep 1m
#oc patch ip $(oc get ip --all-namespaces|grep 'v6.0.0'|awk '{print $2}') -n openshift-mta --type merge --patch '{"spec":{"approved":true}}'
oc patch installplan $(oc get installplan --all-namespaces|grep -E 'v8.0.0|rhbk'|awk '{print $2}') -n openshift-mta --type merge --patch '{"spec":{"approved":true}}'
./5_create_tackle_cr.sh
