Security and configuration
--------------------------

One of the advantages of Red Hat Process Automation Manager, is that it provides a comprehensive development environment, specially if your are building agile cloud native apps. and you need a way to define the users that will interact with your process
Also, if you need to integrate with the corporate authentication mechanisms you have available as part of the product things like :Red Hat SSO is a solution that you can use to secure the web consoles, the REST endpoints to interact with the platform and the access to GIT
In this scenario we will learn how to secure the different components of RHPAM with RH SSO.

So let's go back to your Business Case:
You have 2 different type of users, platform users that are basically the ones that interact with your authoring environment for example the adminUser you used to log in, but for the case of the autoamtion of the credit card dispute we have idetified 3 different roles that interact with teh proces

<img src="../../assets/middleware/rhpam-7-workshop/ccd-workshop-users.png" width="600" />

Here we can see that this are not users but groups that the different user will belong to. So the bank has this 3 groups defined and the tasks for each group will be defined and configure as you automate the process.

***User Configuration***

1- Since the design of the console uses the activity center approach all the tasks related to an activity will be grouped together in a high level menu, in the case of configuration, you will find it when you click on the engine to the left of the username on the right hand side upper menu.

<img src="../../assets/middleware/rhpam-7-workshop/engine-settings-menu.png" width="600" />

2- Once you click on it you will see all the different components that you can configure in your environment for this step will focus on the users and groups

<img src="../../assets/middleware/rhpam-7-workshop/settings-menu.png" width="600" />

3- Click the groups icon and you'll see the group administration menu, where you can list the groups that currently exist, update or delete them or create a new group.

<img src="../../assets/middleware/rhpam-7-workshop/groups-menu.png" width="600" />

4- Click on New Group and we will add the following new groups
- card-holder
- agent
- agent-manager

After you type in the name of the group in this case customer select the adminUser and click on Add selected users to add it to the card-holder group. In a real world scenario all this groups will be associated to different personas but for simplicity the user you have will be part of all the groups needed so you can do your testing.

5- Repeat for the group agent and agent-manager

<img src="../../assets/middleware/rhpam-7-workshop/user-groups-settings-menu.png" width="600" />

***You have successfully completed the installation of your environment.***










