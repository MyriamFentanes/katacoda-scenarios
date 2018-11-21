In this scenario you've learned how to build a reporting page in Red Hat Process Automation Manager 7 on OpenShift using the *DataSource*, *DataSet* and *Pages* capabilities of the platform.

We started by creating a *DataSource* consuming a PostgreSQL relational database using the *Data Source* settings and configuration tooling in the Business Central workbench.

From the configured *DataSource*, we created two *DataSets* using the *DataSource* as the SQL provider. We wrote a SQL query that selects the tasks that have been asssigned to employees, and another query that retrieves customer satisfaction data.

Next, we created two reporting pages and, with the integrated Form Modeler, created pages with various charts that rendered the data provided by the *Data Sets* we created earlier.

Finally, we added the reporting pages to the navigation of the Red Hat Process Automation Manager Business Central workbench.

Red Hat Process Automation Manager supports many more advanced features to create and define (business) reports, consuming various types of data from disparate data sources. Please consult the various online resources (manuals, blogs, demos, forums, etc.) to continue your Red Hat Process Automation Manager journey.
