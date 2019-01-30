Case Management Overview
------------------------

Red Hat Process Automation Manager enables you to automate different pieces of your requirements, in previous scenarios we saw how to automate the decision making regarding solving a Credit Card Dipute, in this scenario we will automate the whole process using Case Management.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam-7-architecture.png" width="600" />

BPM and Case Management
-----------------------

BPM
----
BPM is a management practice that views the "process" as the most important organizing theme. It can be used only when processes are repeatable. A practitioner of BPM talks about "optimizing a process".

In order to optimize a process, there must be a concrete representation of a given process; it must be useful for many individual instances of the process; you must be able to measure how good this process is in abstract from a given case. BPM is a practice of perfecting that process is for the purpose of supporting of future cases.

This only works if you have confidence that future cases will be like the cases of the past that you are measuring the process against.

In short, the process must be predictable. BPM is based on mass production principles: the up front investment that you make in perfecting the process, is paid back in a increase in efficiency over many instances of the process.

Case Management
---------------

Case Management is a technique that is useful when processes are not repeatable. A case represents a situation without necessarily requiring a process.

Case management can be used for one-off situations for which the process can not be predicted in advance. A practitioner of case management needs a different kind of support: instead of tools to aid in the elaborate design and optimization of a process up front, a case manager need a way to communicate goals and intent. There is no point in investing a lot of up front effort in designing an optimized process -- because it is unlikely to fit the situation, and unlikely to pay back the up front investment -- so instead the investment is in information tools and capabilities that can be used directly by the case manager on demand: such as information collecting tools, and communications resources.

<img src="../../assets/middleware/rhpam-7-workshop/business-central-rhpam-7-cmmn-pam.png" width="600" />


- Business processes are usually modelled as flow charts, with starting points and finite end nodes.

- Cases are not structured, they are dynamic and provide room for dynamic tasks.

- Cases reach a business goal through milestones and their success.

- Cases usually consist of loosely coupled process fragments that can be connected.

What about CMMN ?
-----------------------

- Similar constructs and capabilities

- No direct support (yet) for XML format

- Too similar to BPMN 2.0

- Still (too) complex

- Spectrum (vs forcing to choose)



Case Definition
---------------

- Case must have a Case-Id, default is CASE (example ID-XXXXXXXXXX )

- The Case-Id is the Correlation Key

- Case is an Ad-Hoc process, it means dynamic! (no explicit start nodes)

- Case must have role and user assignments

- Case provides a Case File

- Milestones, stages, sub cases can be defined as well (optional)

- Milestones nodes are defined as BPMN work items

- Every BPMN node is available for a case definition (anyway it is still a BPMN process)




Case Roles
----------

- Case roles are generic participants that will be involved in case handling

- Different from jBPM roles, used for human tasks or from jBPM APIs

- Case roles are on case definition level to make the case definition independent

- Anyway these roles can be assigned to user tasks

- Case roles are typically defined when a new case starts

- Can be modified at any time as long as case instance is active though it will not have effect on tasks already created based on previous role assignment.

Milestones
----------

Milestones are part of the case definition and keeps track of important achievement for a case instance

- Milestone actually uses case file as condition to trigger

- Only then milestone will be completed and will follow to next node

- Initial milestones usually are marked to autostart, Adhoc Autostart set to true

- Subsequent milestones must be triggered when a milestone ends

- This is achieved using BPMN signals

- Signal scope must be Process-Instance

Case Stages
------------

- A stage encompasses a set of activities.

- APIs to check the stage of a process.

- A conditional expression define the completion logic.

Dynamic Activities
-------------------

- Dynamic means process definition that is behind a case has no such node/activity
- Cases are not structured, they are dynamic and provide room for dynamic tasks
- Since dynamic tasks do not have data output definition there is only one way to put output from task/subprocess to the process instance - by name. This means the name of the returned output of a task must match by name process variable to be mapped.
- Dynamic BPMN activities are

   - user task
   - service task
   - sub process - reusable







