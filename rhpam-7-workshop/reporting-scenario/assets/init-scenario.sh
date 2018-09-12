#/bin/bash
echo "Initialing environment... This may take a couple of moments."
echo

#Wait for Decision Central OpenShift deployment
echo "Waiting for the Red Hat Process Automation Manager workbench OpenShift Container to start"
until oc project rhpam7-workshop &>2; do echo -n . && sleep 5; done
until oc get dc/rhpam7-workshop-rhpamcentr &>2; do echo -n . && sleep 5; done
oc rollout status "dc/rhpam7-workshop-rhpamcentr" -n rhpam7-workshop
echo

#Wait for Decision Manager workbench availability
echo "Waiting for the Red Hat Process Automation Manager workbench to become available"
export BC_HOST=$(oc describe route "rhpam7-workshop-rhpamcentr" | grep "Requested Host" | sed 's/Requested Host://' | tr -d '[:blank:]')
#until [ $(curl -sL -w "%{http_code}\\n" "http://$DC_HOST/kie-drools-wb.jsp" -o /dev/null) == 200 ]; do echo -n . && sleep 5; done
until curl -s http://$BC_HOST/kie-wb.jsp | grep -q "Business"; do echo -n . && sleep 5; done
echo

echo "Enviroment ready!"
