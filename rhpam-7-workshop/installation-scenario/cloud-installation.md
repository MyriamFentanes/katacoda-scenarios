Red Hat Process Automation Manager is part of a rich set of tools to develop enterprise solution with multiple capabilities, thought to support multidisciplinary teams with the right tools for the tasks at hand.

The cloud native OpenShift environment has already been provisioned for you. You can access it either via a terminal command line (for example if you're an IT professional) or via a web-based console.

## Login

### Command Line

If you want to login to the OpenShift system via the command line interface, you can do so by executing the following command in the terminal: `oc login -u developer -p developer`{{execute}}

As you can see, the IT engineers have already provisioned an environment for you in a project called _credit-card-dispute_.


### Web Console

You can also interact with the OpenShift Container Platform via the Web Console. The OCP Console is available on one of the tabs on the right side of your screen.

- Click on the _OpenShift Console_ tab to open the web-console's login screen
- Login with username `developer`{{copy}} and password `developer`{{copy}}
- You will see a list of the projects that you have access to. In this case this is only the Credit Card Dispute project. Click on the project to open the project page.

## Red Hat Process Automation Platform

When you click on the project you can see there are 2 deployments listed:
- cc-dispute-kieserver
- cc-dispute-rhpamcentr

The overview page shows you your working environment. But what if you have special needs of tools and components? Or you simply want to know what you are working on. Lets go ahead and delete the whole project and start a new deployment based on your requirements.

1. Go back to your home page by clicking the home icon on the top left hand side.
2. Click on the kebab on the right hand side of your project name
3. Select Delete Project.
4. Type in `credit-card-dispute`{{copy}}
5. Click on Delete.

#### Templates

What is a template? Red Hat Process Automation Manager's new design is activity focussed. This means that you have predefined environments available for you to deploy depending on what you want to accomplish. The definitions are modelled in the form of templates. A template describes an environment that follows a Red Hat prescriptive deployment architecture. Templates are provided that define and deploya fully working  platform for development, test, production, etc. Depending on whether you want to develop, integrate, test or run processes and other assets, you can choose your environment of choice.
 Some examples of the available templates are:

- `rhpam70-authoring`: The environment of choice if you are a business user or developer that wants to author business automation projects, assets and applications. Provides an authoring environment including the workbench and an execution server.
- `rhpam70-authoring-ha`: Same as the previous environment, but with high availability features. This implies that there are multiple (by default 2) instances of workbench and execution server deployed.
- `rhpam70-trial-ephemeral`: If you want a quick demo environment to test the platform. Provides the same environment as the `authoring` template but without persistent storage.
- `rhpam70-prod`: If you are the administrator of the platform and you want a production like environment. The template provisions a monitoring and management environment, a smart router and 2 execution server groups.

What kind of environment is right for your you depends on your requirements:
- In which deployment environment is the platform going to be provisioned?
  - Is the environment to be used for process and/or rules development
  - Is the environment used for integration testing
  - Is the environment intended to be used in production?
- What kind of deployment architecture and methodology do you use?
  - Do you want to be able to install and update process definitions and rules via the management console?
  - Do you use the concept of immutable containers, and thus don't allow the provisioning of applications through the management console?
- Do you have a requirement for high availability of the platform?
- What kind of database do you want to integrate with?

For example, if you want an environment to author rules and processes, you can use the `rhpam70-authoring.yaml` that contains all the components necessary to do so. See the image below.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam70-authoring.png" width="600" />

-----------

Quiz: From the previous step what components do you recognize in this template?

-----------
In the case of this workshop, because you need a complete authoring environment with a process server where you can test your assets, we could (or should) deploy the authoring environment. However due to the restrictions of this environment (the platform does not provide persistent storage), we will use the ephemeral template instead.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam70-ephimeral-template.png" width="600" />
