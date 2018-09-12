With our *Data Source* and *Data Set* configured, we can now create our report.

Red Hat Process Automation Manager 7 uses


1. Go to *Menu* -> *Design* -> *Pages* and click on the *New Page* button in the middle of the screen.
  * Name: `incidents-report`{{copy}}
  * Style: `Fluid`
2. The Process Automation Manager drag-and-drop *Page Editor* will open.
3. Explore the *Components* palette. Note that there 3 different types of components, *Core*, *Navigation* and *Reporting*.
4. Open the *Reporting* components palette. Observe that the *Reporting* menu has various reporting components, like *Bars*, *Pie Charts*,  *Lines*, *Meters* and *Maps*.
5. From the *Core* menu, drag the *HTML* component to the top of the page. This will open the *HTLM Editor*.
6. In the *HTML Editor*. Align the text in the centre, enable the *Bold* font and select *h1 (Big Title)*. Write the text "Incidents Report"{{copy}} and click on *Ok*.
7. From the *Reporting* components, drag the *Pie* onto the page. In the *New Displayer* configuration page, click on the *Data* tab and select the *incidents_per_state* Data Set and click on *Ok*.
8. Save the page by clicking on the *Save* button on the top of the screen.
