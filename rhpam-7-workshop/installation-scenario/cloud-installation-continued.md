Our next step is to create a new project and provision the RHPAM Trial Ephemeral environment.

1. If you are not already logged in into the OpenShift Web Console, open it on using the tab on the upper right side of your screen. Login with username `developer` {{copy}} and password `developer`{{copy}}
2. Click on the `+ Create Project` button to create a new project. Use the following values for your project
  - Name: `credit-card-dispute`{{copy}}
  - Display Name: `Credit Card Dispute`{{copy}}
  - Description: `Red Hat Process Automation Manager 7 Credit Card Dispute demo`{{copy}}
3. The _Add to Project_ window will open. We will provision a new RHPAM environment from the OpenShift catalog. In the `Browse Catalog` tab, click on `Uncategorized` and click on the `Select` button in the `Red Hat Process Automation Manager 7.0 ephemeral trial environment` tile.

<img src="../../assets/middleware/rhpam-7-workshop/installation-select-template.png" width="600" />

4. In the form that opens, fill-in the following values:
  - Application Name: `cc-dispute`{{copy}}
  - Default Password: `developer`{{copy}}
  - KIE Admin User: `developer`{{copy}}
  - KIE Server User: `developer`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/installation-template-form.png" width="600" />

5. Scroll down to the bottom of the form and click on the `Create` button. This will process the template and provision the new environment. Click on the `Continue to overview` link on the top of the page to go to the overview page of the your newly created project.
6. When the provisioning is complete, the overview page will show a `cc-dispute-kieserver` deployment and `cc-dispute-rhpamcentr` deployment. The first represents the execution server, the latter the _Business Central_ workbench.

<img src="../../assets/middleware/rhpam-7-workshop/installation-provisioned.png" width="600" />
