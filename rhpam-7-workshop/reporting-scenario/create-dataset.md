Now that we have a *DataSource* defined, we can create our *DataSet*.

A *DataSet* in Process Automation Manager 7 defines a set of data, consumed from one of the supported providers. A provider can be a Java Bean, a CSV file, a database table or SQL query, or an ElasticSearch query. Apart from fetching data from a provider, a *DataSet* also provides functionality like caching and filtering of data, which improves performance and allows for flexibility in data fetching depending on the requirements of the report.

1. Go to the “Settings” screen by clicking on the gear icon in the upper right corner: <img src="../../assets/middleware/rhpam-7-workshop/gear-icon.png" width="30" />

2. Click on the *Data Sets* tile.
3. In the *Data Set Explorer* screen, click on the *New Data Set* button.
4. Select the *SQL* provider type.
5. In the *Data Set Creation Wizard*, provide the following configuration:
  * Name: `active_tasks_per_owner`{{copy}}
  * Data Source: `PAM-Workshop-Reporting`{{copy}}
  * Schema: (leave empty)
  * Source: enable *Query* and use the following SQL Query:
    `select id, status, actualowner FROM task WHERE status = 'active'`{{copy}}
6. Click on the *Test* button. This will execute the query and show a preview of the result.
7. When the test is successful, click on the *Next* button and save the *Data Set*.

The configured query simply selects all the tasks that are active and their owners.

We now have a simple *Data Set* that can be used to create a report, which we will do in the next step of this scenario. Let's first create some additional *Data Sets* that we can use in our reporting pages.

We will now create the DataSet of our customer satisfaction.

1. In the *Data Set Explorer* screen, click again on the *New Data Set* button.
2. Select the *SQL* provider type.
3. In the *Data Set Creation Wizard*, provide the following configuration:
  * Name: `customer_satisfaction`{{copy}}
  * Data Source: `PAM-Workshop-Reporting`{{copy}}
  * Schema: (leave empty)
  * Source: enable *Query* and use the following SQL Query:
<pre class="file" data-target="clipboard">
select *, (case
                    when satisfactionscore <= 50 then '0-50'        
                    when satisfactionscore > 50 and satisfactionscore <= 55 then '50-55'
                    when satisfactionscore > 55 and satisfactionscore <= 60 then '55-60'
                    when satisfactionscore > 60 and satisfactionscore <= 65 then '60-65'
                    when satisfactionscore > 65 and satisfactionscore <= 70 then '65-70'
                    when satisfactionscore > 70 and satisfactionscore <= 75 then '70-75'
                    when satisfactionscore > 75 and satisfactionscore <= 80 then '75-80'
                    when satisfactionscore > 80 and satisfactionscore <= 85 then '80-85'
                    when satisfactionscore > 85 and satisfactionscore <= 90 then '85-90'
                    when satisfactionscore > 90 and satisfactionscore <= 95 then '90-95'
                    when satisfactionscore > 95 and satisfactionscore <= 100 then '95-100'
                    else 'other'
              end) as satisfactionscore_range
    from customer_satisfaction
    order by satisfactionscore_range
</pre>
6. Click on the *Test* button. This will execute the query and show a preview of the result.
7. When the test is successful, click on the *Next* button and save the *Data Set*.

We have now defined two DataSets, let's build some reports.
