
Firts steps to author a case.
-----------------------------

You will learn in this section:


1- How to author your first case.

2- What are roles and variables.


Overview
----------
You are in charge of automating the whole process to solve a dispute, solving a credit card dispute depends on several variables like  the type of customer, the amount of the dispute etc. The knowledge of how to apply this rules and decisions is tacit, lives only in the head of other domain experts like you, in order to automate the process you have to first define what are the steps of the process.

What happens when a Credit Card Holder starts a dispute?

A Credit Card Dispute process is not a straightforward process, you don't start at point A and then follow the path to point B, what happens is that depending on the decision made along the process, and most important the data of the case, you will jum back and forth different steps to be able to solve the dispute.
We have 3 main entities involved in the dispute:

- Credit Card Holder
- Bank that issues the Credit Card
- Merchant that sales the products or services.

As we saw earlier since this is a dynamic process, the best way to model it is as a Case, so we can have the flexibility to jump through the steps back and forth as we gather the information necessary to solve it.
The Issuer will gather information from the Credit Card Holder and the merchant and store it in the Case File. This Case File can be accessed by all of the actors at any time, but you can also apply restrictions to the information.

Case management planning is typically concerned with determination of which Tasks are applicable, or which follow-up Tasks are required, given the state of the Case. Cases are directed not just by explicit knowledge about the particular Case and its context represented in the CaseFile, but also by explicit knowledge encoded as rules by business analysts, the tacit knowledge of human participants, and tacit knowledge from the organization or community in which participants are members.

NOTE: In real life the Issuer would deal with the Credit Card Processor and not the merchant directly but for the sake of simplicity we will just take the merchant into account.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-cc-dispute-diagram-users.png"  width="600" />




Functional requirements of your Case
------------------------------------

There are several thing that could happen when you dispute a case, we will see 2 different scenarios

***Automated Chargeback***

A credit card dispute over billing errors has a good chance of being resolved in your favor thanks to the Fair Credit Billing Act, which regulates how credit card companies handle these disputes, or depending of the amount of the transaction or your status as a customer you can also qualify for an automated chargeback.
The process would look like:

1- CC Holder starts the dispute

2- The information of the case is evaluated and the decision of an automated chargeback is taken.

3- The issuer of the Credit Card (CC) will credit into your account the disputed amount.

***Manual Approval***

The next scenario involves a manual approval and further investigation to determine if the dispute is approved or rejected

1- CC Holder starts the dispute

2- The information of the case is evaluated and the decision of a non automated chargeback is taken.

3- A knowledge worker from the issuer bank reviews tha case file and determines the documents needed from the Credit Card Holder to solve the dispute.

4- The CC Holder submits the documents.

5- A knowledge worker reviews the documentation and determines if the documents are complete or if more information and docs are required, you go back to step3

6- If no more documents are needed from the CC Holder a knowledge worker has to determine if the Merchant needs tobe contacted tp request documents and then trigger again a review of the Merchant documentation

7- In parallel you have to evaluate the information of the case to determine if a manual approval is needed or you can just solve the case automatically with the information available.

*** The Modeler***
-------------------

To model cases and processes we have 2 modelers available, the layout of both follows the same pattern explained below:

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-explained.png"  width="600" />

1- Modelling Canvas - this is your process drawing board. After dropping different shapes onto the canvas, you can move them around, connect them, etc. Clicking on a shape on the canvas allows you to set its properties in the expandable Properties Window (3) (as well as create connecting shapes and morph the shape into other shapes).

2- Toolbar - the toolbar contains a vast number of functions offered by Designer (described later). These includes operations that can be performed on shapes present on the Canvas. Individual operations are disabled or enabled depending on what is selected. For example, if no shapes are selected, the Cut/Paste/Delete operations are disabled, and become enabled once you select a shape. Hovering over the icons in the Toolbar displays the description text of the operation.

3-  Properties Panel - this expandable section on the right side of Designer allows you to set both process and shape properties. It is divided into four sections, namely "Core properties", "Extra Properties, "Graphical Settings" and "Simulation Properties". After clicking on a shape in the Canvas, this panel is reloaded to show properties specific to that shape type. If you click on the canvas itself (not on a shape) the panel displays general process properties.

4-  Object Library Panel - the expandable section on the left side of Designer shows the jBPM BPMN2 (default) shape repository tree. It includes all shapes of the jBPM BPMN2 stencil set which can be used to assemble your processes. If you expand each section sub-group you can see the BPMN2 elements that can be placed onto the Designer Canvas (1) by dragging and dropping the shape onto it.

5- View Tabs - currently Designer offers three tabs for Process Modelling, Simulation and Documentation. Process Modelling is the default tab. When users run process simulation, its results are presented in the Simulation tab. Process Documentation tab displays documentation generated from process definition.

6- Info Tabs - there are two additional tabs at the top of Designer. The Editor tab includes the process modeling while the Overview tab displays the process metadata such as version history, creation date, last modification date etc.



Case Variables and Roles
------------------------

We have defined the Business Object Model and the Business Decisions on the last lab, so you need to import the following repository. You can watch the video about how to import a repository into your workspace

1- Import the rest of the Domain Model and Decisions by importing the project Domain Model and Rules CC Dispute  from the following repository:

https://github.com/MyriamFentanes/fsi-credit-card-dispute-case.git

1- Go to your library view and click on Add Asset, from the asset catalog select Case Definition, configure the following values:

Name: `ChargeDispute`{{copy}}
Package: `com.fsi_credit_dispute`{{copy}}


<img src="../../assets/middleware/rhpam-7-workshop/business-central-asset-business-legacy.png"  width="600" />


*** Defining Case Variables***

1- On the properties panel, In the Variable Definitions property field, click on the v icon to open the variable definitions editor, add the following values



Name:  `customerStatus`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `totalFraudAmount`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `fraudData`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `approveChargeback`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `customerAge`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `incidentCount`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `cardholder`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `cardholderRiskRating`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `caseType`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `managerApprovalRequired`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `managerReason`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `vendorDoc`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type: org.jbpm.document.Document

    Case File: true

    KPI: false

Name:  `vendorDocRequired`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `vendorDocReviewed`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

Name:  `customerDocReviewed`{{copy}}

    Defined Types: Client (this is the type we created earlier)

    Custom Type:

    Case File: true

    KPI: false

At the end you should have something like the following:

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-variables.png"  width="600" />


***Roles***

People can have different roles in our case, the mapping to this roles is provided when the case instance is started, and can be changed afterwards.
Defining the roles

1- On the properties panel look for the Case Roles option and click on the V icon to the right.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-designer-roles.png"  width="600" />

2- Add the roles

Case Role: `owner`{{copy}}
Case Cardinality: 1


Case Role: `approval-manager`{{copy}}
Case Cardinality: 1

The cardinality refers to the number of actors that can be mapped to a role.




We have completed the setup of your case. The solution for this lab can be found in the following repo:


https://github.com/MyriamFentanes/katacoda-scenarios