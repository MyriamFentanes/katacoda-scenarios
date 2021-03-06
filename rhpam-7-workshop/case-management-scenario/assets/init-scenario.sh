#/bin/bash
echo "Initializing environment... This may take a couple of moments."
echo

#Wait for Decision Central OpenShift deployment
echo "Waiting for the Red Hat Process Automation Manager workbench OpenShift Container to start"
until oc project ccd-project &>2; do echo -n . && sleep 5; done
until oc get dc/ccd-project-rhpamcentr &>2; do echo -n . && sleep 5; done
oc rollout status "dc/ccd-project-rhpamcentr" -n ccd-project
echo

#Wait for Decision Manager workbench availability
echo "Waiting for the Red Hat Process Automation Manager workbench to become available"
export BC_HOST=$(oc describe route "ccd-project-rhpamcentr" | grep "Requested Host" | sed 's/Requested Host://' | tr -d '[:blank:]')
#until [ $(curl -sL -w "%{http_code}\\n" "http://$DC_HOST/kie-drools-wb.jsp" -o /dev/null) == 200 ]; do echo -n . && sleep 5; done
until curl -s http://$BC_HOST/kie-wb.jsp | grep -q "Business"; do echo -n . && sleep 5; done
echo

echo "Enviroment ready!"
