In this scenario you've learned how to build a reporting page in Red Hat Process Automation Manager 7 on OpenShift using the *DataSource*, *DataSet* and *Pages* capabilities of the platform.

We started by creating a *DataSource* consuming a MariaDB relational database using the *Data Source* settings and configuration tooling in the Business Central workbench.

From the configured *DataSource*, we created a new *DataSet* using the *DataSource* as the SQL provider. We wrote a SQL query that selects the top 10 states in the USA with the most incident.

Next, we created a new reporting page and, with the integrated Form Modeler, created a Pie chart that rendered the data of the *DataSet* that we created in the previous step.

Finally, we added the reporting page to the navigation of the Red Hat Process Automation Manager Business Central workbench.

Red Hat Process Automation Manager supports many more advanced features to create and define (business) reports, consuming various types of data from disparate data sources. Please consult the various online resources (manuals, blogs, demos, forums, etc.) to continue your Red Hat Process Automation Manager journey.
