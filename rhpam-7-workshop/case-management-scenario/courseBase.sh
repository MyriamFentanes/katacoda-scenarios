#!/bin/bash
ssh root@host01 'echo "Pulling the local environment for Red Hat Process Automation Manager" >> script.log'
ssh root@host01 'for i in {1..200}; do docker pull quay.io/mfentanes/rhpam7-katacoda && break || sleep 2; done'
ssh root@host01 'echo "Running the local environment for Red Hat Process Automation Manager" >> script.log'
ssh root@host01 'for i in {1..200}; do docker run -p 8080:8080 quay.io/mfentanes/rhpam7-katacoda && break || sleep 2; done'
