
How to author Decisions and rules?
----------------------------------

You will learn in this section:


1. How to use your Business Object Model to automate decisions and policies.

2. The different types of authoring tools available to you.

3. How to use your automated decisions and rules.


You are in charge of automating the decisions that need to be taken to solve a dispute, solving a credit card dispute depends on several variables like  the type of customer, the amount of the dispute etc. The knowledge of how to apply this rules and decisions is tacit, lives only in the head of other domain experts like you, in order to automate the process you will have to express it in teh form of rules.
For this particular case 2 set of rules are defined for different stages on the process:


***Calculating the Risk***

The cost of processing a dispute for Pecunia Corp. is very high per dispute and totally independent of the amount that is been disputed, that is why its very important to have flexible rules that are compliant on one hand but also that take into acco time unt the profile and loyalty of Pecunia Corp. customers to solve a dispute.Right now all the process is manual, so there is a group of agents dedicated to make decisions based on the data of the dispute, this is not only expensive but also very prone to error and inconsistent.

The rules defined for the process are:


- Automatic chargeback is only available to Platinum and Gold Credit Card Holders


- The risk of the transaction is determined by the type of user and the amount of the dispute

         - Standard customer 0-100 risk low risk
	     - Standard customer 100-500 medium
         - Standard customer anything above 500 high
         - Gold customer anything less than 500 low risk
         - Gold customer anything more than 800 high risk
         - Silver customer anything between 250-500 medium risk
         - Silver customer anything below 250  low risk

Regulations

- If the customer billing address is in the state on Texas, California or Florida the dispute should be consider of higher risk.



***The Authoring Tools ***
-----------------------------------

We have defined the Business Object Model in the previous lab, so you need to import the following repository. You can watch the video on how to import a repository into your workspace

1. Import the rest of the Domain Model by importing the project Domain Model CC Dispute  from the following repository:

https://github.com/MyriamFentanes/fsi-credit-card-dispute-case.git

Now we will create the rules to process a Credit Card (CC) Dispute automatically, meaning without the need of any human intervention.

1. Select the project credit-card-dispute in the space MySpace

<img src="../../assets/middleware/rhpam-7-workshop/business-central-asset-ccd-project.png"  width="600" />

2. You will see the Domain Object Model as the only assets listed, click on the blue button Add Asset on the right upper corner of the Library View.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-ccd-bom-project.png"  width="600" />

3. Select Guided Rule from the catalog of Wizards

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule.png"  width="600" />

4. Set the following data in the creation wizard:

Name: `automated-chargeback`{{copy}}

Package: `com.fsi_credit_dispute`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new.png"  width="600" />

5. Click ok. You should see a banner in green telling you that the Asset was succesfully created and the wizard to author your rule.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new-wizard.png"  width="600" />

***Guided Rules ***
-----------------------------------

Guided Rules are one of the type of rules you can create in Business Central, once you have defined the Business Object Model you can use it to create rule that check conditions on the properties of the object, for example a Credit Card Holder. If the condition or conditions are met you can define an action or a decision to take:
In the case of the rules for automatic chargeback we are evaluating only the CC Holder. So lets create the rule:
First we need to tell the rule what object or collection of objects are we going to evaluate. Rules have a very basic syntax, you have the When section a.k.a teh Right Hand Side (RHS) or Conditional, here is where you put the discrimination criteria that you need to apply to CC Holders that quialify for an automated chargeback.

1. You will see 4 tabs in the wizard panel, select the tab that says Data Object

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-import-data-object.png"  width="600" />

2. Click on the blue button New Item

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-import-data-object-new.png"  width="600" />

3. Choose CardHolder as the type and click ok

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-import-data-object-type.png"  width="600" />

4. Return to the model tab and Click on the green cross to the right of the word When.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new-fact.png"  width="600" />

5. Select the object CardHolder, and click ok. We are now telling the rule engine that everytime there is a CreditCardHolder we will activate this rule.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new-fact-select.png"  width="600" />

In order to match the criteria of the functional requirement we need to add another restriction, automated chargeback is only approved for CC Holders that are of type Platinum or Gold.

6. Click on the condition There is a Credit Card Holder, a new wizard opens, we aregoing to add a restriction to a field in this case the staus of the CC Holder

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new-property-select.png"  width="600" />

7. From the dropdown box we select that the status is contained in the list, and add the literal value of Gold and Platinum. TIP: You can also add enumerations containing this values to have them prepopulated for you.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-new-property-select-values.png"  width="600" />

8. Complete the same procedure, to import the Fraud Data object, awe don't need to check any property of the Fraud Data just make sure that is there.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-check-fraud-data.png"  width="600" />

9. When you want to modify the data in the objects of the Business Model or facts, you need to store the object of the case in a variable inside the rule. Click on the fact declaration There is FraudData, the wizard to modify the constraints will open.

10. On the last field type data as the name of the variable that you want to use to store the Fraud Data object, click on the button Set

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-modify-fraud-data.png"  width="600" />

Now we are going to set the property of automated chargeback to true on the Fraud Data obeject so the dispute can be processed accordingly. Since this is the decision we are making based on the input we will define it as the WHEN clause a.k.a Left Hand Side (LHS) or Action section.
All of the information of the CC dispute is stored in facts, this facts can live in a session that the engine will keep in memory so every time you evaluate a new fact or change something, you will have all of the Object in the session available and inteviening in the decision making. In the LHS or action section you can change the values of any property on the objects that you have stored in variables, or even add new objects to the session. Everytime a property in an object changes, all of teh decisions wil be reevaluated to make sure that no other rule needs to be applied.

11. Click on the green arrow next to the WHEN keyword, when the Add new action wizard opens select Change field values of data, the variable that you created before and click on +ok.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-modify-fraud-data-wizard.png"  width="600" />

12. Now we are going to set teh value of the property automated to true, indicating that an automatic chargeback applies. Click on  the action Set value of Fraud Data and add the property automated. Click on the pencil icon to teh right and assign a literal value to the property.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-modify-fraud-automated.png"  width="600" />

13. select true as the value for the automated property. Note that since the type of data is boolean, you can only choose between true or false

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-modify-fraud-automated-true.png"  width="600" />


14. To validate that everything is correct click on the Validate button on the right and you should see a green "Item successfully validated!" message. Next click on Save.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-guided-rule-validate.png"  width="600" />


You have created your first Business Rule using the Guided editor

***Decision Tables***
-----------------------------------

A very common way to define the logic behind the risk assessment is usually stored in spreadsheets, with Red Hat Process Automation Manager you can use the same spreadsheet and make it an executable asset in the engine. In this section we are going to create a Decision table to automate the risk assessment rules that were given to you.


1. First we go back to the Library view and we click on the blue button Add Asset

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-add-asset.png"  width="600" />

2. We select Guided Decison Table from the Catalog of assets

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-add-asset-guided.png"  width="600" />

3. Type the following values on the Create New Decision Table wizard

Name: `risk-evaluation`{{copy}}
Package: `com.fsi_credit_dispute`{{copy}}
Select the checkbox: Use Wizard

Click ok and Finish

4. You should see the Guided Decision Table Wizard with an empty table.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-new.png"  width="600" />

There are 5 tabs in the wizard:

Model: The model diagram of the Decison Table
Columns: Wizard to Add, Edit or Delete columns in your table. Each column is a constraint in a property of a Business Model Object.
Overview: Contains the metainformation of your asset: Version, Description, Last Modified, etc.
Source: Is the actual source code that is generated from the Decision Table Model.
Data Objects: Lists the Business Objects available to the wizard to be used as conditions or actions

The properties evaluated to determine the risk scoring are:

- Status of the Credit Card Holder
- Total Amount disputed from the Fraud Data

Lets add the Credit Card Holder condition column

5. Go to the columns tab and click on the button Insert Column, Select Add Condition and click Next

<img src="../../assets/middleware/rhpam-7-workshop/business-central-add-condition.png"  width="600" />

6. We need to define what is the object that is going to be evaluated. Click on Create new fact pattern, we select CreditCardHolder as the Fact type and we create a variable called holder and bind the object to it. Click next

<img src="../../assets/middleware/rhpam-7-workshop/business-central-create-pattern.png"  width="600" />

7. The calculation type is the type of evaluation that we are going to apply, in this case it will be against literal values. Select literal value and Click next

8. Select the field status and Click Next

<img src="../../assets/middleware/rhpam-7-workshop/business-central-create-pattern-field.png"  width="600" />

9. Next we select the operation for the constraint, select equal to from the drop down menu and Click next

<img src="../../assets/middleware/rhpam-7-workshop/business-central-create-pattern-field-operator.png"  width="600" />

10. Since there are only 3 possible status, we are going to configure the Value List with the following and then click Next

`"Standard,Gold,Silver"`{{copy}}

<img src="../../assets/middleware/rhpam-7-workshop/business-central-create-pattern-field-values.png"  width="600" />

11. We now configure the label of the column

Header: `Status`{{copy}}

Click Finish and hgo back to the tab model. Yoou should see the new created column.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-create-pattern-field-header.png"  width="600" />

12. Repeat the same steps to add 2 more columns both for the object FraudData, property: totalFraudAmount operation: greater than for one column and less than for the second column. Note that for the second column you don't need to create a new fact pattern, you can reuse the existing one.


At the end you should have something like this

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-columns.png"  width="600" />

13. Next go to the Columns tab and Click on insert column, select Set the value of a field, this time we are adding an action that will be fired if the conditions are met. Click Next

14. We want to determine the risk scoring property of the FraudData object, so in the dropdown menu select the object FraudData stored in th3 variable data.Click Next

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-columns-action-data.png"  width="600" />

15.  Select the field disputeRiskData and click Next , we don;t have a list of values so click Next, type Risk Scoring as the header for the column and click Finish

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-columns-action-data-finish.png"  width="600" />

16. go back to your model tab and you should have something like this:

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-columns-action-data-finish-model.png"  width="600" />

Now we are going to add the actual constraints, if we look back to our requirements the first decision is:

Standard customer 0-100 risk low risk

Click on the button Insert and select append row from the dropdown menu.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-append-row.png"  width="600" />

Click on the Description cell of the new row and type Low risk standard costumer, repeat for the rest of teh columns with the following values

Description:`Low risk standard costumer`{{copy}}
Status:`Standard`{{copy}}
Minimum Amount:`0`{{copy}}
Max Amount:`100`{{copy}}
Risk Scoring:`100`{{copy}}

You shoud have something like the following at the end. Click Save.


<img src="../../assets/middleware/rhpam-7-workshop/business-central-decision-table-first-row.png"  width="600" />

Do the same procedure for the rest of the rules.


***DMN ***
-----------------------------------

You can also import decision models created in editors like Trisotech into Red Hat Process Automation Manager in the following image we can see and example of the tyoe of diagrams you can create to define the rules to calculate risk.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-trisotech-dmn.png"  width="600" />

DMN uses a language business friendly called FEEL or Friendly Enough Expression Language.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-dmn-feel.png"  width="600" />

DMN is outside the scope of this scenario, but as you see you have multiple tools available to automate the decisions of your process and in your business applications.
