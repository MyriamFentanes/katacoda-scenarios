

The requirements that are handed to you:


****REQUIREMENTS****
---------------------


------------------------------------------------------------------------------------------------------------------------------

**Business:**

The type of security questions that the customers needs to answer depend on the merchant and the use case, this is very important as some of the information is necessary for the Payment gateway to process the refund or chargeback with the merchant.his questions are also susceptible to continuous change as the regulations may change with short notice, and as new type of credit card products come out this also need to be updated and maintained by the business user.


**Stakeholder**

Process a credit card dispute

**Functional Solution:**

Have a dynamic questionnaire , that has subordinated questions and answers based on previous questions answers. This will be implemented in a decision table that the business user can download as a spreadsheet, change any given question or add new ones and the upload the spreadsheet or save directly on the platform wizard.

**Non Functional:**

Allow the user to change the questions without technical assistance, have the tooling for the user to update the questions but also offline just using standard spreadsheets.

------------------------------------------------------------------------------------------------------------------------------

**Business:**

The cost of processing a credit card dispute is very high, and also very critical to the customer, so a risk assessment must be performed based on the customer profile, the type of dispute, and the amount. This could lead to an automatic processing or to a manual approval to solve the dispute.
The rules to qualify the risk for a credit card dispute are:

- Automatic process is only available to Platinum and Gold customers

         - Standard user 0-100 risk low risk
	     - Standard customer 100-500 medium
         - Standard customer anything above 500 high

- The risk of the transaction is determined by the type of user and the amount of the dispute

         - Gold customer anything less than 500 low risk
         - Gold customer anything more than 500 high risk
         - Silver customer anything between 250-500 medium low risk
         - Silver customer anything below 250  low risk


**Stakeholder**

Customer/Process a credit card dispute

**Functional Solution:**

Have a decision table that will take into account the criteria defined to assess risk and automated processing, the business user can change this criteria anytime if needed and apply the change immediately. 


**Non Functional:**

Allow the user to change the questions without technical assistance, have the tooling for the user to update the questions but also offline just using standard spreadsheets.

------------------------------------------------------------------------------------------------------------------------------

**Business:**

Every amount larger than 1000 should be manually approved.

**Stakeholder**

Process a credit card dispute

**Functional Solution:**

Have a rule in the systmem that makes sure that everytime you get a transaction with an amount > 1000 it triggers a user task to review the dispute.
**Non Functional:**

Allow the user to change the amount.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------



