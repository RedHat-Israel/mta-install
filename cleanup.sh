#!/bin/bash
oc delete project openshift-mta
oc delete catalogsource mta-to-upgrade -nopenshift-marketplace
