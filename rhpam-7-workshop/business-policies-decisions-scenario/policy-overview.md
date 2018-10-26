
Why a decision service?
-----------------------

The credit card dispute process is not a straightforward process, it involves different actors inside and outside of the company that need to have visibility at all time with what is happening.
So everything starts with the customer disputing a transaction.

The issuer of the credit card in this case Pecunia Corp. the actor outside of the corporation are:

- The Card Network that process the transaction and it's the connection point between the Issuer of the Credit Card in this case Pecunia Corp. and the Acquirer
- The Acquirer the the contact point of the merchants that provide the goods or services and to whom the Issuer might need to request information.


For this particular case 2 set of rules were clearly defined for different stages on the process:


***Calculating the Risk***

The cost of processing a dispute for Pecunia Corp. is very high per dispute and totally independent of the amount that is been disputed, that is why its very important to have flexible rules that are compliant on one hand but also that take into account the profile and loyalty of Pecunia Corp. customers to solve a dispute.

The rules defined are:


- Automatic process is only available to Platinum and Gold customers

         - Standard customer 0-100 risk low risk
	     - Standard customer 100-500 medium
         - Standard customer anything above 500 high

- The risk of the transaction is determined by the type of user and the amount of the dispute

         - Gold customer anything less than 500 low risk
         - Gold customer anything more than 500 high risk
         - Silver customer anything between 250-500 medium low risk
         - Silver customer anything below 250  low risk


 The first thing we identify is the business entity that the rules

***Requiring Manager Approval***

If you don't want to interact with the platform from a command line terminal, you can also access the Web Console. The OCP Console is available on one of the tabs in your screen.

    - Login using the same credentials that you used before.

    - You will see a list of the projects that you have access to. In this case is only Credit Card Dispute.

** Red Hat Process Automation Platform **

When you click on the project you can see there are 2 deployments listed.

     - cc-dispute-kieserver
     - cc-dispute-rhpamcentr

 If you look at the diagram,this comprises your working environment.
 But what if you have special needs of tools and components? Or you simply want to know what you are working on.
 Lets go ahead and delete the whole project and start a new deployment based on your requirements.

     - Go back to your home page by clicking the home icon on the top left hand side.
     - Click on the kebab on the right hand side of your project name
     - Select Delete Project.
     - Type in `credit-card-dispute`{{copy}}
     - Click on Delete.

Now what?
---------
****Extra points****


****TEMPLATES****


 What is a template? Red Hat Process Automation new design is activity centered, so you have predefined environments available to deploy depending on what do you want to accomplish. the definition is modeled in form of templates which are environments that follow a Red Hat prescriptive deployment architecture, to provide a fully working  platform for development, production, or SIT  to develop, integrate, test or run processes and other assets.
 Some examples of the available templates are:

      -  If you are a business user that will author business assets- rhpam70-authoring
      -  If you are the administrator of the platform and you want a production like environment with immutable engines: rhpam70-prod-immutable-kieserver
      -  If you are part of the operations team and you want to monitor your production environment: rhpam70-prod-immutable-monitor
      -  If you want a quick demo environment to test the platform - rhpam70-trial-ephemeral

 The difference between them lies on what type of environment do you want?, what do you want it for?, with high availability or not? So for example if you want an environment to author rules and process, you have the rhpam70-authoring.yaml that contains all the components necessary to do so. See the image above.
 Quiz: From the previous step what components do you recognize in this template?

 In this particular case because you need a complete authoring environment with a process server where you can test your assets we could deploy the authoring environment, however due to the restrictions on this environment we will use the ephemera template instead.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam70-authoring.png" width="600" />

You will be working in a development version of the Credit Card Dispute project, you need an environment that has no security restrictions, one of the new features in the Red Hat Process Automation Manager is the ability to just order a complete environment with just the components needed for your daily tasks.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam70-ephimeral-template.png" width="600" />


