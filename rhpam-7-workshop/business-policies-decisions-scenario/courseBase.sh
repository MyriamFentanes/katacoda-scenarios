#!/bin/bash
ssh root@host01 'echo "Importing Red Hat Process Automation Manager 7 Image Streams into OpenShift." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.2.0.GA/rhpam72-image-streams.yaml -n openshift && break || sleep 2; done'
ssh root@host01 'echo "Patching Image Streams." >> ~/script.log'
ssh root@host01 "for i in {1..200}; do oc patch is/rhpam72-businesscentral-openshift --type='json' -p '[{\"op\": \"replace\", \"path\": \"/spec/tags/0/from/name\", \"value\": \"registry.access.redhat.com/rhpam-7/rhpam72-businesscentral-openshift:1.1\"}]' -n openshift && break || sleep 2; done"
ssh root@host01 "for i in {1..200}; do oc patch is/rhpam72-kieserver-openshift --type='json' -p '[{\"op\": \"replace\", \"path\": \"/spec/tags/0/from/name\", \"value\": \"registry.access.redhat.com/rhpam-7/rhpam72-kieserver-openshift:1.1\"}]' -n openshift && break || sleep 2; done"
ssh root@host01 'echo "Importing Red Hat Process Automation Manager 7 - Trial template into OpenShift." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-container-images/rhpam-7-openshift-image/7.2.0.GA/templates/rhpam72-trial-ephemeral.yaml -n openshift && break || sleep 2; done'
ssh root@host01 'echo "Importing create-react-app-openshift template." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/DuncanDoyle/reactjs-openshift/master/create-react-app-openshift-template.yaml -n openshift && break || sleep 2; done'
#ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/openshift/origin/v3.7.0/examples/db-templates/postgresql-ephemeral-template.json -n openshift && break || sleep 2; done'
ssh root@host01 'echo "Logging into OpenShift as developer." >> ~/script.log'
#ssh root@host01 'for i in {1..200}; do oc login localhost:8443 -u developer -p developer --insecure-skip-tls-verify=true && break || sleep 2; done'
ssh root@host01 'for i in {1..200}; do oc login -u developer -p developer --insecure-skip-tls-verify=true --certificate-authority=/etc/origin/master/admin.crt && break || sleep 2; done'
ssh root@host01 'echo "Creating new demo project in OpenShift." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc new-project rhpam7-workshop --display-name="Credit-Card-Dispute" --description="Red Hat Process Automation Manager 7 - Credit Card Dispute" && break || sleep 2; done'
ssh root@host01 'echo "Creating Business Central and KIE Server containers in OpenShift." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc new-app --template=rhpam72-trial-ephemeral -p APPLICATION_NAME="rhpam7-workshop" -p IMAGE_STREAM_NAMESPACE="openshift" -p KIE_ADMIN_USER="developer" -p KIE_SERVER_CONTROLLER_USER="kieserver" -p KIE_SERVER_USER="kieserver" -p DEFAULT_PASSWORD="developer" -p MAVEN_REPO_USERNAME="developer" -p MAVEN_REPO_PASSWORD="developer" -p BUSINESS_CENTRAL_MEMORY_LIMIT="2Gi" -e JAVA_OPTS_APPEND=-Derrai.bus.enable_sse_support=false -n rhpam7-workshop && break || sleep 2; done'
ssh root@host01 'echo "Patching Business Central OpenShift route to increase proxy timeout." >> ~/script.log'
ssh root@host01 'for i in {1..200}; do oc annotate route rhpam7-workshop-rhpamcentr --overwrite haproxy.router.openshift.io/timeout=3600s -n rhpam7-workshop && break || sleep 2; done'

# Deploy our ReactJS app
ssh root@host01 'for i in {1..200}; do oc get route rhpam7-workshop-kieserver -n rhpam7-workshop | awk "FNR > 1 {print \$2}" > kie-server-url.txt && break || sleep 2; done'
ssh root@host01 'for i in {1..200}; do oc new-app -e KIE_SERVER_URL=http://$(cat kie-server-url.txt) -e KIE_SERVER_USER=kieserver -e KIE_SERVER_PWD=developer --template react-web-app -p SOURCE_REPOSITORY_URL=https://github.com/DuncanDoyle/rhpam7-workshop-reactjs-rules-client -n rhpam7-workshop && break || sleep 2; done'
