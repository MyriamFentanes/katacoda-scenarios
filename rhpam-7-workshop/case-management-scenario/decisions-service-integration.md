
Decisions Integration.
----------------------

You will learn in this section:


1- How to further enhance your Case Model.

2- Integrating Decisions in the Case Model.

The Credit Card dispute case
----------------------------

<img src="../../assets/middleware/rhpam-7-workshop/business-central-cc-dispute-diagram-users.png"  width="600" />


There are several thing that could happen when you dispute a case, we will see 2 different scenarios

***Automated Chargeback***
----------------------------------


A credit card dispute over billing errors has a good chance of being resolved in your favor thanks to the Fair Credit Billing Act, which regulates how credit card companies handle these disputes, or depending of the amount of the transaction or your status as a customer you can also qualify for an automated chargeback.
The process would look like:

1- CC Holder starts the dispute

2- The information of the case is evaluated and the decision of an automated chargeback is taken.

3- The issuer of the Credit Card (CC) will credit into your account the disputed amount.


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

You have just learned how to leverage the Decisions and Rules you author in the previous scenario, when a new case is started you will receive the data to process the Dispute. When you reach a Business Rule node in the Case Model this data stored in the Case variables. The variables can be of primitive type or reference the Object Model will be passed to the rules.

The evaluation of the rules can produce more data or modify the existing one, and all these will be stored in the case variables.


*** Adding the Automatic Chargeback functionality ***

For specific Credit Card Holders when the amount is below a certain threshold, the Issuer will automatically accredit back the dispute amount into the account, without any further processing.

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


You have just integrated rules in your case, to modify the execution flow by triggering Milestones.
It's important to remember that the Case instance is constantly listening to changes in the Object Model or case variables if they are marked as CaseFile variables. If a variable changes, this will automatically trigger Milestones giving your case a Data driven type of execution.




