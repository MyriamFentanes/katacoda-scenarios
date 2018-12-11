
# Business Object Model

In this section you will learn

1. What is the Business Object Model.

2. How to create it inside the Business Central Web Console.

3. How to import a project into your space.

The credit card dispute process is not  straightforward, it involves different actors inside and outside of the company, this actors  need to have visibility at all time of what  is happening during the execution.
So everything starts with the customer disputing a transaction.

The issuer of the credit card in this case Pecunia Corp. the actor outside of the corporation are:

- The Card Network that process the transaction and it's the connection point between the Issuer of the Credit Card in this case Pecunia Corp. and the Acquirer.
- The Acquirer the the contact point of the merchants that provide the goods or services and to whom the Issuer might need to request information.


One of the requirements to successfully process a dispute is that all of the parties involved are aware of the dispute at all time. Since the they can all influence the final resolution of the dispute. Because different parties will have visibility and sometimes control over the process we need a domain model that clearly describes the objects that interact in the process.

So far we can identify 3 major entities:

- Card Holder
- Fraud Data
- Additional Information


## The Business Domain Context

You as business domain expert, need to define what is the domain model for the business capability you are trying to automate. Eric Evans coined the term Domain Driven Design that holds 3 main guiding principles: Focus on the core domain; explore models in a creative collaboration of domain practitioners and software practitioners; and speak a ubiquitous language within an explicitly bounded context. You can learn more about this design approach in his book.
So the first and very important task to automate a core business capability is to create a definition of the business entities within the context of Credit Card Dispute, in this case the first entity is the Customer, the definition in the context of our use case maybe totally different from the definition inside Pecunia Corp. but it will be common  among the team of business and technology experts.

Creating the Card Holder entity.

1. Login to business-central web console

<img src="../../assets/middleware/rhpam-7-workshop/business-central-console.png" width="600" />

2. Remember that the UI was design using an activity oriented approach, in this case we want to design our Business Entity Model. Select Design from the main menu, you will be redirected to your working space, this is the sandbox for you to define your projects and within those projects assets.

3. Click on Add Project to create a new Project in your space called MySpace, when the Add Project wizard opens up type in
`credit-card-dispute`{{copy}} as the name of the project
Assets to automate the credit card dispute process as the description of your project.

Once the creation of your project is complete you should see the following page with a Library View of your assets, empty so far.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-asset-empty-project.png"  width="600" />

4. In the upper right corner you will see a blue button caleld `Add Asset`. An asset is any Rule, Process, Decision Table, Data Object, Data Form, etc. Click on the `Add Asset` button and you will be presented with a catalog of the wizards to create assets.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-asset-catalog.png" width="600" />

5. Select the wizard for _Data Object_ from the catalog to create your business object model for the Credit Card Holder, type `CardHolder` as the name of the object and select com.myspace.ccd_project as the Package. Click OK

<img src="../../assets/middleware/rhpam-7-workshop/business-central-CCD-object-new.png" width="600" />

6- You will see the new created object with no properties, lets click on the `+add field` button to start adding the properties to our CreditCardHolder.


<img src="../../assets/middleware/rhpam-7-workshop/business-central-CCD-object-new-empty.png" width="600" />


7- Click  in the window for New Field create a new property with the following values:

Age `age`{{copy}}

Identifier: `age`{{copy}}

Label: `Age`{{copy}}

Description: `Age of the Credit Card Holder`{{copy}}

Type: Integer

<img src="../../assets/middleware/rhpam-7-workshop/business-central-CCD-object-new-properties.png" width="600" />

8- Watch the video on how to import a repository into your workspace.

9- Create the rest of the Domain Model by importing the project Domain Model CC Dispute  from the following repository:

https://github.com/MyriamFentanes/business-policies-decisions-scenario-step2.git
