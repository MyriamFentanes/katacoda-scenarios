Verifying your installation
---------------------------

So far you have requested in your self-service console a working environment to author process and policies, now we will verify the environment and the tools available to you.
Earlier we saw that Red Hat Process Automation has authoring tools both for developers as well a subject domain experts.

<img src="../../assets/middleware/rhpam-7-workshop/collaboration_tools.png" width="600" />

So in the case of business experts we have the Business Central console a web based business application with capabilities to manage the full lifecycle of your automation assets.

***Business Central***
--------------------------

1- Go to your Openshift console tab and login using the same credentials as before:
user: developer
password: developer

<img src="../../assets/middleware/rhpam-7-workshop/openshift-console.png" width="600" />

2- Once logged in you should see your project or workspace called Credit Card Dispute

<img src="../../assets/middleware/rhpam-7-workshop/credit-card-dispute-project.png" width="600" />

3- Click on your project to see the components.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-detail.png" width="600" />

You will see listed 2 components the cc-dispute-kieserver and the cc-dispute-rhpamcentr all you need to know is that the first one is for execution of your automation assets and the latter for authoring of your automation assets
So at this point we are interested on the authoring environment.

4- Select the cc-dispute-rhpamcentr an look at the details of the component

<img src="../../assets/middleware/rhpam-7-workshop/business-central-route.png" width="600" />
