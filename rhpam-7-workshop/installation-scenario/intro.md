# The Business Background

It is your first day working at Pecunia Corp. One of the divisions of the company is the Issuer, and one of the most common, yet expensive, tasks is the dispute of a credit card transaction.
In this scenario we will look at the installation process of Red Hat Process Automation Manager (RHPAM) 7 on OpenShift Container Platform, as well as some of the tasks that a production installation will require.
Note: Because of the limitations of the workshop environment, all of the topics regarding persistence will be omitted.

One of the processes that the bank has identified as a candidate for automation is the _credit card dispute_ process. The processing cost of this business process is very high, regardless of the amount that is being disputed. Second, it is also a heavily regulated process that requires:

- Audit trails
- Mandatory steps to be taken

In this workshop we will automate this process to:
- reduce the processing cost.
- improve customer satisfaction by reducing turnaround time through automation.
- make decisions reproducable by automating business rules.
- provide insight into the process, enabling the use of analytics to analyse and optimize the dispute process.
