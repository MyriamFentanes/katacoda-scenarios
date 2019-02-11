#!/bin/bash
ssh root@host01 'echo "Pulling the local environment for Red Hat Process Automation Manager" >> script.log'
ssh root@host01 'docker pull quay.io/mfentanes/rhpam7-katacoda'
ssh root@host01 'echo "Running the local environment for Red Hat Process Automation Manager" >> script.log'
ssh root@host01 'docker run -p 8080:8080 quay.io/mfentanes/rhpam7-katacoda'
