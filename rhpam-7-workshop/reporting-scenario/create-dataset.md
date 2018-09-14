Now that we have a *DataSource* defined, we can create our *DataSet*.

A *DataSet* in Process Automation Manager 7 defines a set of data, consumed from one of the supported providers. A provider can be a Java Bean, a CSV file, a database table or SQL query, or an ElasticSearch query. Apart from fetching data from a provider, a *DataSet* also provides functionality like caching and filtering of data, which improves performance and allows for flexibility in data fetching depending on the requirement of the report.

1. Go to the “Settings” screen by clicking on the gear icon in the upper right corner: <img src="../../assets/middleware/rhpam-7-workshop/gear-icon.png" width="30" />

2. Click on the *Data Sets* tile.
3. In the *Data Set Explorer* screen, click on the *New Data Set* button.
4. Select the *SQL* provider type.
5. In the *Data Set Creation Wizard*, provide the following configuration:
  * Name: `incidents_per_state`{{copy}}
  * Data Source: `PAM-Enablement`{{copy}}
  * Schema: (leave empty)
  * Source: enable *Query* and use the following SQL Query:
		`SELECT S.state_name, COUNT(I.incident_reason) as number_of_incidents FROM FACT_INCIDENTS as I INNER JOIN DIM_STATES as S ON I.state_id = S.state_id GROUP BY S.state_name ORDER BY number_of_incidents DESC LIMIT 10`{{copy}}
6. Click on the *Test* button. This will execute the query and show a preview of the result.
7. When the test is successful, click on the *Next* button and save the *Data Set*.

The configured query counts the number of incidents per state and selects the top 10 states with the most incidents.

We now have a simple *Data Set* that can be used to create a report, which we will do in the next step of this scenario.
