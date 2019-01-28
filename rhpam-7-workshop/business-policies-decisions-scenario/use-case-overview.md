# Use Case Overview

The requirements that are handed to you:
These requirements are the policies of Pecunia Corp. to handle a credit card transaction.


## Requirements

The cost of processing a credit card dispute is very high, and also critical from the customer experience perspective. Usually the credit card holder is stressed to protect the assets trusted to the bank, therefore one of the most critical aspects of the interaction with the dispute system is the constant feedback to the customer, informing constantly the latest status of the dispute. E.g., what is currently happening with the dispute, is additional information from the customer required, has the dispute been automatically accepted, has something gone wrong with the dispute, etc.

A lot of the complexity with the CC Dispute process comes from the fact that is a multi-step process where every dispute is a one-off situation, the actual outcome of the dispute is a result of the interactions of different actors and the decision logic. On top of that, the information regarding the case, has to be the input and output of every interaction between the actors, all need to look at the same data and be observers of changes in it.

We can resume the process in the following diagram:


<img src="../../assets/middleware/rhpam-7-workshop/business-central-cc-dispute-processing.png"  width="600" />

The actors that we can identify are:

- Credit Card Holder: aka Customer
- Credit Card Issuer: In this case Pecunia corp.
- Card processing network:  The organization that oversees the process. As noted below, some differ in their procedures than others.
- Credit Card Acquirer: A financial institution that obtains the rights to the merchant’s account and tasked with getting payment on the merchant’s behalf.
- Merchant: Seller of the goods and must either fight or accept the chargeback

We are going to focus on the process from the perspective of the Issuer, since is the one that has the direct communication with the CC Holder and resolves the dispute.

In a simplified version the process is:

1- The Credit Card Holder starts a dispute with the CC Issuer.
2- The CC Issuer needs to decide what type of processing is required y the dispute (automated chargeack or normal processing).Jump to step 3.1. or 3.2.
3.1- The CC Issuer process the automated chargeback. Jump  to step 5.1.
3.2 - The CC Issuer needs to do standard processing, contact the Card Processing network to start the dispute, the Credit Processing Network then contacts the CC Acquirer that requests evidence to the merchant and a formal response to the dispute.
3.3 - The Merchant send the evidence and response to the CC Issuer
4- The CC Issuer assess the risk of the dispute.
4.1- The CC Issuer requests a manual approval for the dispute from a knowledge worker. Jump to step 5.1. or 5.2
4.2- The CC Issuer based on the data resolves the case. Jump to step 5.1. or 5.2
5.1- The dispute is accepted and the money reimbursed to the CC Holder and the backoffice chargeback for fee transactions started
5.2- The dispute is rejected
6- The CC Issuer informs the CC Holder of the result.


--------------------------------------------------

### Business:

A risk assessment must be performed based on the customer's profile, the type of dispute, and the amount. This could lead to automatic processing of the dispute or to a manual approval step to solve the dispute.

We define 2 sets of rules, one set that determines whether the dispute can be qualified for automated chargeback, and a set that determines the risk of the dispute.

The requirement for automatic chargeback qualification is:

- _Automatic processing is only available to customers with a Gold or Platinum status._

The risk of the transaction is determined by the status of customer and the amount of the dispute:

- _For a standard customer, and a dispute amount between 0 and 100, the risk is low._
- _For a standard customer, and a dispute amount between 100 and 500, the risk is medium_
- _For a standard customer, and a dispute amount above 500, the risk is high._
- _For a silver customer, and a dispute amount below 250, the risk is low._
- _For a silver customer, and a dispute amount between 250 and 500, the risk is medium._
- _For a silver customer, and a dispute amount above 500, the risk is high._
- _For a gold customer, and a dispute amount below 500, the risk is low._
- _For a gold customer, and a dispute amount over 500, the risk is medium._


### Stakeholder

Customer/Process a credit card dispute

### Functional Solution:

Have business rules that will take into account the criteria defined to assess risk and automate processing. The business user can change these criteria anytime if needed, and apply the changes immediately. 


### Non Functional:

Allow the user to change the criteria without technical assistance. Have the tooling for the user to update the rules but using standard spreadsheet-like decision tables.

------------------------------------------------------------------------------------------------------------------------------

### Business:

Every amount larger than 1000 should be manually approved.

### Stakeholder

Process a credit card dispute

### Functional Solution:

Have a rule in the system that makes sure that every time you get a transaction with an amount > 1000 it triggers a user task to review the dispute.

### Non Functional:

Allow the user to change the amount.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

### Business:

The type of security questions that the customers needs to answer depend on the merchant and the use case, this is very important as some of the information is necessary for the Payment gateway to process the refund or chargeback with the merchant. These questions are also susceptible to continuous change, as the regulations may change with short notice. And, as new type of credit card products come out this also need to be updated and maintained by the business user.

### Stakeholder

Process a credit card dispute

### Functional Solution:

Have a dynamic questionnaire that has subordinated questions and answers based on previous questions answers. This will be implemented in a decision table that the business user can download as a spreadsheet, change any given question or add new ones and then upload the spreadsheet or save directly on the platform wizard.

### Non Functional:

Allow the user to change the questions without technical assistance. Have the tooling for the user to update the questions online and offline using standard spreadsheets.

------------------------------------------------------------------------------------------------------------------------------
