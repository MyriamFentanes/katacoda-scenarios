  Copyright 2018 Entando
1
ENTANDO + RED HAT PAM CASE MANAGEMENT

  ENTANDO + RED HAT PAM CASE MANAGEMENT
    Copyright 2018 Entando
2

  SUMMARY
Introduction 3 Overview 3
Building a Case Management Dashboard 4 Lab Setup 4 Install a Entando Application With PAM Integration 4 Create Dashboard Page Model 4 Create New Dashboard Page 8 Configuring the Widgets on the Page 9
Addendum 13 Generating a New Entando + PAM App from Source 13 Generating a New Entando + PAM App with Docker 14
Copyright 2018 Entando
3
ENTANDO + RED HAT PAM CASE MANAGEMENT

  INTRODUCTION
OVERVIEW
Welcome to this Training Lab for getting started with Entando App Builder and Red Hat Process Automation Manager. The goal of this lab is to walk through building POC applications that front the Business Automation components of the Red Hat product offerings. This lab book focuses on ​Building a Case Management Application.
ENTANDO + RED HAT PAM CASE MANAGEMENT
 Copyright 2018 Entando
4

  BUILDING A CASE MANAGEMENT DASHBOARD
LAB SETUP
Forthislab,wewillcreateaCaseManagementDashboardusinganewpagemodel. Thislab assumes that you have a KIE deloyment running in a PAM process server that includes a Case Definition. Importoneofthesamplesifyoudonothaveoneavailable:
● Get the project into Business Central
o Select“TrySamples”frommenunearthetopright o Clickonthe“ITOrders”boxsoitishighlighted
o Click“Ok”
o Onceitfinishesimporting,clickthe“Deploy”button
INSTALL A ENTANDO APPLICATION WITH PAM INTEGRATION
If you have not already done so, refer to the following steps to install a local .
● Download the distribution: ​https://central.entando.com/en/downloads.page
● Extract to the folder of your choice
● Open the sample project folder:
● cdEntando_5.0.0_PAM_App_Manager/entando-pam-sample
● Start up the application
● mvn-Djetty.port=8180cleanjetty:run
● Open application: ​http://localhost:8180/entando-pam-sample/
● Click “Go to login Page” button
● User: admin
● Password: adminadmin
● Be sure to configure / test the connection to your PAM Process Server:
ENTANDO + RED HAT PAM CASE MANAGEMENT
   Copyright 2018 Entando
5

  o Integrations>Components>RedHatPAMConfig CREATE DASHBOARD PAGE MODEL
● UX Pattern > Page Models > “Add” button
● Code: case-management-dashboard
● Name: Case Management
● XML Configuration
<?xml version="1.0" encoding="UTF-8"?> <frames>
<frame pos="0">
<descr>Case Selector</descr>
<sketch x1="0" y1="0" x2="11" y2="0" /> <defaultWidget code="bpm-case-instance-selector">
<properties>
<property key="channel">1</property> <property
key="frontEndCaseData">{"container-id":"itorders_1.0.0-SNAPSHOT","knowledge-source-id":"1"}</property> </properties>
</defaultWidget> </frame>
<frame pos="1">
<descr>Case Details</descr>
<sketch x1="0" y1="1" x2="11" y2="1" /> <defaultWidget code="bpm-case-details">
<properties>
<property key="channel">1</property>
</properties> </defaultWidget>
</frame>
<frame pos="2">
<descr>Progress Bar</descr>
<sketch x1="0" y1="2" x2="11" y2="2" /> <defaultWidget code="bpm-case-progress-status">
<properties>
<property key="channel">1</property>
<property key="frontEndMilestonesData">{"container-id":"itorders_1.0.0-SNAPSHOT","name":"Order for IT
hardware","knowledge-source-id":"1","case-id-prefix":"IT","stages":[],"id":"itorders.orderhardware","milestone s":[{"milestone-id":"_DCD97847-6E3C-4C5E-9EE3-221C04BE42ED","milestone-name":"Milestone 1: Order placed","milestone-mandatory":false,"visible":true,"percentage":20},{"milestone-id":"_343B90CD-AA19-4894-B63C- 3CE1906E6FD1","milestone-name":"Milestone 2: Order shipped","milestone-mandatory":false,"visible":true,"percentage":20},{"milestone-id":"_52AFA23F-C087-4519-B8F2 -BABCC31D68A6","milestone-name":"Milestone 3: Delivered to customer","milestone-mandatory":false,"visible":true,"percentage":20},{"milestone-id":"_483CF785-96DD-40C1-914 8-4CFAFAE5778A","milestone-name":"Hardware spec ready","milestone-mandatory":false,"visible":true,"percentage":20},{"milestone-id":"_79953D58-25DB-4FD6-94A0-D FC6EA2D0339","milestone-name":"Manager decision","milestone-mandatory":false,"visible":true,"percentage":20}],"ui":{"progress-bar-type":"stacked","ad ditionalSettings":["show-milestones","show-number-of-tasks"]},"version":"1.0"}</property>
</properties> </defaultWidget>
</frame>
<frame pos="3">
<descr>Case Roles</descr>
<sketch x1="0" y1="3" x2="5" y2="6" /> <defaultWidget code="bpm-case-roles">
<properties>
<property key="channel">1</property>
</properties> </defaultWidget>
</frame>
<frame pos="4"> <descr>Case File</descr>
Copyright 2018 Entando
6
ENTANDO + RED HAT PAM CASE MANAGEMENT

  <sketch x1="6" y1="3" x2="11" y2="6" /> <defaultWidget code="bpm-case-file">
<properties>
<property key="channel">1</property>
</properties> </defaultWidget>
</frame>
<frame pos="5">
<descr>Case Comments</descr>
<sketch x1="0" y1="7" x2="11" y2="7" /> <defaultWidget code="bpm-case-comments">
<properties>
<property key="channel">1</property>
</properties> </defaultWidget>
</frame> </frames>
o NOTE​​: The layout previews at the bottom of screen and updates in real-time when making changes to the grid configuration
● Template:
<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]> <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" /> <title>
<@wp.currentPage param="title" /> - <@wp.i18n key="PORTAL_TITLE" /> </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />
favicon.png" type="image/png" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="<@wp.resourceURL />static/js/entando-misc-html5-essentials/html5shiv.js"></script> <![endif]-->
<@c.import url="/WEB-INF/aps/jsp/models/inc/content_inline_editing.jsp" />
<@c.import url="/WEB-INF/aps/jsp/models/inc/header-inclusions.jsp" />
<style type="text/css"> .row {
padding-top:20px; padding-bottom:10px; border-bottom:2px solid #e7eaec; margin-right: 0 !important; margin-left: 0 !important;
}
</style> </head>
<body class="pace-done">
<div class="pace pace-inactive">
<div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);"> <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div> </div>
<div id="wrapper">
<div id="page-wrapper" class="gray-bg dashbard-1">
<div class="row white-bg">
Copyright 2018 Entando
7
ENTANDO + RED HAT PAM CASE MANAGEMENT

  <div class="col-md-3">&nbsp;</div> <div class="col-md-6">
<div class="white-bg"><@wp.show frame=0 /></div> </div>
<div class="col-md-3">&nbsp;</div> </div>
<div class="row white-bg"> <div class="col-md-12">
<div class="white-bg"><@wp.show frame=1 /></div> </div>
</div>
<div class="row white-bg">
<div class="col-md-12">
<div class="white-bg"><@wp.show frame=2 /></div>
</div> </div>
<div class="row white-bg"> <div class="col-md-6">
<div class="white-bg"><@wp.show frame=3 /></div> </div>
<div class="col-md-6">
<div class="white-bg"><@wp.show frame=4 /></div>
</div> </div>
<div class="row white-bg"> <div class="col-md-12">
<div class="white-bg"><@wp.show frame=5 /></div> </div>
</div> </div>
</div> </body>
</html>
● Click “Save” at the bottom of the screen (below the grid preview) ●
●
CREATE NEW DASHBOARD PAGE
● Page Designer > Page Tree > “Add” button
● Provide:
o (en)Title:CaseDashboard o (it)Title:Gestionedelcaso o Selectpageplacement
▪ Click on one of the pages in the tree to be the parent page
▪ Select the Home Page so it is highlighted o PageGroups
Copyright 2018 Entando
8
ENTANDO + RED HAT PAM CASE MANAGEMENT

  ▪ Choose Free Access for both Owner / Join Group, click the plus button o PageModel:selectournew“CaseManagement”model
● Click Save and Configure
CONFIGURING THE WIDGETS ON THE PAGE
● Drag and drop the following Case Widgets onto their respective squares with the following configuration options (select the same channel number for each):
o CaseInstanceSelector
▪ Select knowledge source, Deployment Unit, ​Channel
● What is a channel? A channel allows widgets to share information. In this example, the case selector widget will allow the user to choose a particular case instance. The following widgets (details, progress etc.) listen to the channel to know which particular case instance they should should data about.
o Casedetails
o Caseprogressstatus
● Knowledge Source / Deployment Unit / Case Definition
● Select basic (% done) or stacked milestone list
● Hide/show milestones
● Add weight to % done if applicable (add up to 100)
o CaseRoles
o CaseComments
o CaseFileEditor
o NOTE​​:PAM-CaseActionsandPAM-Casechartarenotworkingandisaknownissue for the current release
● Completed dashboard:
Copyright 2018 Entando
9
ENTANDO + RED HAT PAM CASE MANAGEMENT

  ENTANDO + RED HAT PAM CASE MANAGEMENT
 ●
Openthepage...Whereisit? Hint:lookinthatpage’sdetailsinthePageTree:thesmallglobe is a direct link to the page. For reference, if the page name was “case” and was a child of the home page, the URL would be:
http://{server:port}/entando-pam-sample/en/case.page
CASE MANAGEMENT WIDGETS
Here is quick overview of the Case Management widgets included in the dashboard we created above:
Copyright 2018 Entando
10

  ENTANDO + RED HAT PAM CASE MANAGEMENT
 1. PAM-Case Instance selector: lists the available cases for the selected knowledge source/deployment unit. The user configured in the Red Hat PAM Config must have access to the case in order for it to show up on the list. Selecting a case instance and clicking “Select” will notify the other case widgets on the screen to update their data.
2. PAM-Case Details: displays a quick summary header about the case including: status, owner, date started etc.
3. PAM-Case progress status: A highly configurable progress bar for a specific type of case instance based on milestone status. Can either show as a percentage done bar (with configurable weights for partictular milestones) or as a list of milestones that indicate status (with a configurable list of which milestones are displayed.
Copyright 2018 Entando
11

  ENTANDO + RED HAT PAM CASE MANAGEMENT
 4. PAM-Case roles: Displays the current role assignments and allows them to be edited
5. PAM-Case file: Displays the contents of the case file, and allows the values to be edited.
6. PAM-Case comments: Lists the comments attached to the case and allows new comments to
be appended.
NEED TO GENERATE CASES?
Can generate from the Swagger docs page:
● Command: [POST] server/containers/{id}/cases/{caseDefId}/instances
● Id: itorders_1.0.0-SNAPSHOT
● caseDefId: itorders.orderhardware
Copyright 2018 Entando
12

  ● body: {
"case-user-assignments" : { "owner" : "​adminUser​​",
       "manager" : "",
       "supplier" : ""
     },
"case-group-assignments" : { "manager" : "​IT​​",
"supplier" : "​IT​​" }
}
● Should receive a result with the Case Instance ID
● Note​​: the owner must match the user that Entando is configured to use in the PAM
configuration,
● Curl equivalent (running locally):
   curl -X POST
   "http://localhost:8080/kie-server/services/rest/server/containers/itorders_
   1.0.0-SNAPSHOT/cases/itorders.orderhardware/instances" -H "accept:
   application/xml" -H "content-type: application/json" -d "{
   \"case-user-assignments\" : { \t\"owner\" : \"adminUser\", \"manager\" :
   \"\", \"supplier\" : \"\" }, \"case-group-assignments\" : { \"manager\" :
   \"IT\", \"supplier\" : \"IT\" }}"
ADDENDUM
GENERATING A NEW ENTANDO + PAM APP FROM SOURCE
All commands are in bold, with some options in red.
1. cd <my-base-dir>​​ Go to the directory where you want to create your Entando application. The command in step two will create a new directory with your app in it wherever you run that command from.
2. mvn archetype:generate -Dfilter=entando
a. select org.entando.entando:entando-archetype-web-app-BPM (typically #11)
b. Choose version: 5.1.0-SNAPSHOT or 5.0.0​​:
ENTANDO + RED HAT PAM CASE MANAGEMENT
 Copyright 2018 Entando
1. 5.0.0 is the latest release
2. 5.1.0-SNAPSHOT may have some updates
1. If not an option, update Maven settings.xml c. choose app group/artifact/version
i. E.g.
1. Group: ​com.mycompany.entando
13

  2.
a.
2.
2. Artifact: ​my-app-name
3. Version: ​1.0.0-SNAPSHOT
cd ​​my-app-name
Replace “my-app-name” with the artifact name you chose mvn -DskipTests -Djetty.port=8180 clean jetty:run
For access to snapshot versions of the archetypes, add the following profile block to your settings.xml:
<!-- <profiles> -->
     <profile>
        <id>allow-snapshots</id>
           <activation><activeByDefault>true</activeByDefault></activation>
        <repositories>
          <repository>
<id>snapshots-repo</id> <url>​https://oss.sonatype.org/content/repositories/snapshots​</url> <releases><enabled>false</enabled></releases> <snapshots><enabled>true</enabled></snapshots>
          </repository>
        </repositories>
      </profile>
<!-- </profiles> -->
GENERATING A NEW ENTANDO + PAM APP WITH DOCKER
All commands to be typed are in bold, with some options in red.
● docker pull entando/engine-api
● docker run -it --rm -d --name=​​engine-api​​ -p ​​8080​​:8080 entando/engine-api
o This will make Entando engine available at http://localhost:8080
o You can specify a different local port, e.g. 8180: docker run -it --rm -d
--name=engine-api -p 8180:8080 entando/engine-api
o The “name” value is of convenience, so you do advanced Docker commands,
like ssh in, or pull logs out using this name rather than the random one that is
assigned
o The -d flag allows the container to run “in the background”. You will need to
explicitly stop it when you’re done (e.g., docker stop engine-api)
o The --rm flag will instruct Docker to delete the container once it’s stopped. If
you want to stop / restart you will need to remove this
ENTANDO + RED HAT PAM CASE MANAGEMENT
 Copyright 2018 Entando
14
