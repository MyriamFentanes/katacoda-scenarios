Case Management Overview
------------------------

Red Hat Process Automation Manager enables you to automate different pieces of your requirements, in previous scenarios we saw how to automate the decision making regarding solving a Credit Card Dispute, in this scenario we will automate the whole process using Case Management.


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


Some key differences between BPM and Case Management specification are:


Case Roles
----------

Case roles are generic participants that will be involved in case handling, and are dynamic, you can specify case roles independently of the existing roles and just map them to interact with the engine. Some characteristics of Case Roles are:

- Different from BPM roles, used for human tasks to interact with the engine.

- Case roles are on case definition level to make the case definition independent

- Case roles are typically defined when a new case starts

- Can be modified at any time as long as case instance is active though it will not have effect on tasks already created based on previous role assignment.


Milestones
----------

Milestones are part of the case definition and keeps track of important achievement for a case instance. Some characteristics are:


- Milestone can use Case File information as a condition to trigger

- Only then milestone is completed, it will follow to next node. Milestones don't implement any functionality.

- Initial milestones usually are marked to autostart, Adhoc Autostart. This means that Milestones don't need a start node to activate.

- Subsequent milestones can be triggered when a milestone condition triggers, making it easier to track the progress of the Case.



Case Stages
------------

- A stage encompasses a set of activities, that are logically bound together.

- Several stages can run in parallel, and you can trigger the same stage several times.

- A conditional expression define the completion logic of a stage, using the information of the Case File.


Dynamic Activities
-------------------

Dynamic means in the context of Case Management that the process definition that is behind a case has no such node/activity. You can add this type of activities at when the case is started and running, like discretionary activities. Some characteristics of Dynamic Activities are:

- Cases are not structured, they are dynamic and provide room for dynamic tasks
- Since dynamic tasks do not have data output definition there is only one way to put output from task/subprocess to the process instance - by name. This means the name of the returned output of a task must match by name process variable to be mapped.
- Dynamic activities are

   - user task
   - service task
   - sub process - reusable







