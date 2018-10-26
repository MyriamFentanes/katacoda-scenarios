Security and configuration
--------------------------

One of the advantages of Red Hat Process Automation Manager, is that it provides a comprehensive development environment, specially if your are building agile cloud native apps. and you need a way to define the users that will interact with your process
Also, if you need to integrate with the corporate authentication mechanisms you have available as part of the product things like :Red Hat SSO is a solution that you can use to secure the web consoles, the REST endpoints to interact with the platform and the access to GIT
In this scenario we will learn how to secure the different components of RHPAM with RH SSO.

So let's go back to your business case:
You have 2 different type of users, platform users that are basically the ones that interact with your authoring environment for example the adminUser you used to log in, but for the case of the autoamtion of the credit card dispute we have idetified 3 different roles that interact with teh proces
<img src="../../assets/middleware/rhpam-7-workshop/collaboration_tools.png" width="600" />







