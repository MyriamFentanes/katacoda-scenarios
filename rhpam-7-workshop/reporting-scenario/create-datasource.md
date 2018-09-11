  Before we can build a reporting page, we first need to define and create a so called *DataSet* that will provide the data that our report(s) will render.

  As mentioned in the introduction of this scenario, a DataSet in Process Automation Manager 7 can be based on various data providers, including Java Beans, CSV and SQL. In this example we will use a DataSet that uses the SQL provider.

  For this scenario, we’ve prepared a database with car incident data in the USA. The database is a MariaDB database.

  * Host: `opendigitalautomation.com`{{copy}}
  * Port: `3306`{{copy}}
  * User: `developer`{{copy}}
  * Password: `developer`{{copy}}
  * Database: `pam7-enablement`{{copy}}

In Business Central, you can use this information to create a new DataSource.

---
**NOTE**

Process Automation Manager 7 comes with pre-provisioned database-drivers for MariaDB, MySQL and PostgreSQL. Since we will be using a MariaDB relational database, we can use the pre-provisioned driver. If you want to connect to other database systems, e.g. Oracle, SQL-Server, etc., the required driver can be added using the *+ Add Driver* button.

---

1. Go to the “Settings” screen by clicking on the gear icon in the upper right corner: <img src="../../assets/middleware/rhpam-7-workshop/gear-icon.png" width="30" />

2. Click on the *Data Sources* tile.
3. Click on *+ Add DataSource* on the left-hand side of the screen, which will open the *New data source form*.
4. Fill in the following values:
  * Name: `PAM-Enablement`{{copy}}
  * Connection URL: `jdbc:mariadb://opendigitalautomation.com:3306/pam7-enablement`{{copy}}
  * User: `developer`{{copy}}
  * Password: `developer`{{copy}}
  * Driver: `MariaDB-1.3.4`
5. Click on “Test Connection” to test the setup and if the test is OK, click on “Finish”

Now that we've created the DataSet, we can explore its content.

1. Click on the *PAM-Enablement* DataSet that we've just created.
2. Click on the *Browse content* button at the top of the panel. This will open the *Default schema* of the datasource.
<img src="../../assets/middleware/rhpam-7-workshop/pam-enablement-dataset-explore.png" width="600" />
3. The *Default schema* of our database contains four tables. Two *dimension* tables contain the states of the USA and the months of the year, while two *fact* tables contain the incidents and quotes.
4. Click on the *Open* button next to the `DIM_STATES` table and explore the table's content.
5. Go back to the *Default schema* page and click on the *Open* button next to the `FACT_INCIDENTS` table and explore the table's content.

Now that we've created a connection to our MariaDB *DataSource* we can define the *DataSet* that will be rendered in  our report.
