# Use Case Overview

The requirements that are handed to you:
These requirements are the policies of Pecunia Corp. to handle a credit card transaction.


## Requirements

The cost of processing a credit card dispute is very high, and also critical from the customer experience perspective. Usually the credit card holder is stressed to protect the assets trusted to the bank. One of the most critical aspects of the interaction with the dispute system is the constant feedback to the customer, i.e. the system and the process for disputing a transaction has to constantly inform the credit card holder on the status of the dispute. E.g., what is currently happening with the dispute, is additional information from the customer required, has the dispute been automatically accepted, has something gone wrong with the dispute, etc.
These are all considerations that need to be taken into account when automating the process.

-----------------

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
