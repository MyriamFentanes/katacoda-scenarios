We will now create a second report that visualizes our customer satisfaction. For this we use our the `customer-satisfaction` *Data Set* that we created earlier.

In this report we will try to create a bar-chart that shows the number of customer satisfaction reports per satisfaction score range. I.e. we count all scores that core lower than 50%, and after that we count the number of scores per 5% range, e.g. 50%-55%, 55%-60%, 60%-65%, etc.

Note that the query we've used in our data-set already categorizes each customer satisfaction entry into one of these ranges.


1. Go to *Menu* -> *Design* -> *Pages* and click on the *New Page* button in the middle of the screen.
  * Name: `customer-satisfaction-report`{{copy}}
  * Style: `Fluid`
2. The Process Automation Manager drag-and-drop *Page Editor* will open.
3. From the *Core* menu, drag the *HTML* component to the top of the page. This will open the *HTLM Editor*.
6. In the *HTML Editor*. Align the text in the centre, enable the *Bold* font and select *h1 (Big Title)*. Write the text "Customer Satisfaction Report"{{copy}} and click on *Ok*.
7. From the *Reporting* components, drag the *Bar* onto the page. In the *New Displayer* configuration page, click on the *Data* tab and select the *customer_satisfaction* Data Set. Next, select *satisfactionscore_range* in the *Categories* drop-down list and select the *id* : *Count* in the *Series* section. Click on *Ok*.
8. Add a *Table* component to the page and use the same *Data Set* as the data provider.
9. Feel free to add additional components to improve the page.

As in the previous report, try to enable filters on the data by select a bar in the bar-chart. Notice how the entry in the table gets filtered.

<img src="../../assets/middleware/rhpam-7-workshop/create-report-customer-satisfaction.png" width="600" />
