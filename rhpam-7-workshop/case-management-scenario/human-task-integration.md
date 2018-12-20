
Decisions Integration.
----------------------

You will learn in this section:


1- How to further enhance your Case Model.

2- Integrating Human Interaction in the Case Model.

The Credit Card dispute case
----------------------------

<img src="../../assets/middleware/rhpam-7-workshop/business-central-cc-dispute-diagram-users.png"  width="600" />


There are several thing that could happen when you dispute a case, we will see 2 different scenarios

***Manual Approval***

The next scenario involves a manual approval and further investigation to determine if the dispute is approved or rejected

1- CC Holder starts the dispute

2- The information of the case is evaluated and the decision of a non automated chargeback is taken.

3- A knowledge worker from the issuer bank reviews tha case file and determines the documents needed from the Credit Card Holder to solve the dispute.

4- The CC Holder submits the documents.

5- A knowledge worker reviews the documentation and determines if the documents are complete or if more information and docs are required, you go back to step3

6- If no more documents are needed from the CC Holder a knowledge worker has to determine if the Merchant needs tobe contacted tp request documents and then trigger again a review of the Merchant documentation

7- In parallel you have to evaluate the information of the case to determine if a manual approval is needed or you can just solve the case automatically with the information available.


***Using Business Decisions in a Case***


In the previous step we defined the Milestones of the case, import the Case Model from the following repository:

https://github.com/MyriamFentanes/fsi-credit-card-dispute-case.git

To be able to decide the type of processing of the Credit Card Dispute we need to apply the rules for automatic chargeback processing that we automated in the previous scenario. The rules look something like this:

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-modify-fraud-automated-true.png"  width="600" />

If you open the asset you will notice that we have added a extra property called rule-flow-group, this property is a meta-attribute that enables us to modify the execution of the rules, in this case we are grouping a set of rules to use them later on.

The evaluation to decide if a chargeback should be automatic is the first step after the Dispute is started, so we are going to add the step right after the Milestone: Dispute started is triggered. Remember that Milestones don't perform any actions are just to mark a target of the case as achieved, but we can link functionality to it. This nodes will start after the Milestones is triggered.

1-  Add a node of type Business Rule to the Milestone: Dispute started. In the properties panel add the following information:

Name:  `Check for automated chargeback`{{copy}}
Task Type: Business Rule
Rule Flow Group: `automated-chargeback`{{copy}}


2- Add and end event node after the Business Rule "Check for automated chargeback"


<img src="../../assets/middleware/rhpam-7-workshop/business-central-case-first-business-rule-node.png"  width="600" />

You have just learned how to leverage the Desicions and Rules you author in the previous scenario, when a new case is started you will receive the data to process the Dispute. When you reach a Business Rule node in the Case Model this data stored in the Case variables. The variables can be of primitive type or reference the Object Model will be passed to the rules.

The evaluation of the rules can produce more data or modify the existing one, and all thsi will be stored in the case variables.


*** Adding the Automatic Chargeback functionality ***

For certain Credit Card Holders when the amount is below a certain threshold, the Issuer will automatically accredit back the dispute amount into the account, without any further processing.

In our model we have Milestone that marks thar the CC Holder has achieved that target, if you recall from the last scenario the Milestone is triggered by a condition. The Milestone is triggered when the property automated in the Object FraudData is set to true.
The Rules for automatic-chargeback modify this property and set it to true if the conditions are met.

1- Open the CreditDispute Case and examine in the properties panel the condition to trigger the execution. The condition is declared in assignements> Data Inputs and Assignments> Condition. The condition is set as a constant value.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-case-fautomated-chargeback-condition.png"  width="600" />

The last step to finish the dispute is to accredit the fraud amount back to the account, we will add the functionality and then trigger the Milestone: Account credited

2- Add a node of type Script to the Milestone 3: Automated Chargeback Processing, input the following information to the Node in the properties panel.


Name:  `Accredit the Fraud Amount to CC  Holder`{{copy}}
Task Type: Script
Script:`System.out.println("Amount accredited into the account");`{{copy}}

Here we are simulating the call to an external service, that will actually accredit the account.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-case-automated-chargeback-script.png"  width="600" />

Finally since the account was accredited due to the automatic processing we will trigger the Milestone 4: Account Acredited

3- Add and End Event of type signal after the Script node and input the following information.

Name:  `Account Acredited`{{copy}}
SignalRef: `Milestone 4: Account Acredited`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/business-central-case-automated-chargeback-end-event.png"  width="600" />

4- Click save.



***Milestones ***
-----------------------------------

We have defined the case variables , if you want to skip to the next step you can import the following repository. You can watch the video on how to import a repository into your workspace

1- Import the rest of the Domain Model by importing the project Domain Model CC Dispute  from the following repository:

https://github.com/MyriamFentanes/fsi-credit-card-dispute-case.git


To model the milestones of the case:

1- Select from the Object Library Panel a Node of type  Start event then add a Script node connected to this start event. On the properties panel for the Script node enter the following:

Name: `Log Case Started`{{copy}}
Script  `System.out.println("Case started");`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-script-task.png"  width="600" />

Add and end event of type signal the name of the signal should be the same as the Milestone, so once you've completed Logging that the case has started the signal will trigger a Milestone called Dispute Received.

Signal Ref:  `Milestone 1: Dispute received`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-script-task-end-event.png"  width="600" />

2- Add a milestone node

Name:  `Milestone 1: Dispute received`{{copy}}
Ad hoc autostart: false

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-milestone-dispute-received.png"  width="600" />

3- Save your process.


In this example we saw that Milestone can be triggered by signals, you can add logic after a milestone that will execute when the node is triggered. Another way to trigger a Milestone is when a condition on the data of the CaseFile is met.

4- Add a second Milestone

Name:  `Milestone 2: Customer doc received`{{copy}}
Ad hoc autostart: false

5- Look in the properties panel for the assignments section and click on the V icon, select the source property on the input assignment condition.
Select constant as the value and type

`org.kie.api.runtime.process.CaseData(data.get("customerDocReviewed") == true)`{{copy}}


<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-milestone-docs-received.png"  width="600" />

In here we are checking that the variable customerDocReviewed is true to trigger Milestone 2: Customer doc received and consider that target as achieved. We will repeat the same process for the other milestones we defined at the beginning.

Name:  `Milestone 3: Automated Chargeback`{{copy}}
Condition:`org.kie.api.runtime.process.CaseData(data.get("vendorDocReceived") == true)`{{copy}}

This Milestones will be triggered by a signal

Name:  `Milestone 4: Account credited`{{copy}}
Condition:none


Name:  `Milestone 5:  Dispute rejected`{{copy}}
Condition:none


