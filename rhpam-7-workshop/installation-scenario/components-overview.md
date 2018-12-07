# Setting up your work environment

Red Hat Process Automation Manager enables you to automate different pieces of your requirements, you can automate the decision making, the flow of the decision making, the interaction between the people and systems, etc.
You need to become familiar with the environment to author, deploy, execute and manage your process instances, and take advantage of the cloud native environment available. Things such as OpenShift self-service console will allow you to provision, recreate, destroy  your working environment and be autonomous from other users .

The following diagram depicts the main components of Red Hat Process Automation Platform.

 <img src="../../assets/middleware/rhpam-7-workshop/high-level-capability-compoponents.png" width="600" />

## High Level Capabilities Components

### Decision Management
A high-performant, lightweight and scalable rules and decision execution engine based on the open-source [Drools](http://www.drools.org) community project. Allows business and IT users to define rules in decision tables, guided rules and the DMN (Decision Model and Notation) standard.

### Business Optimization
An AI Constraint Satisfaction Solver that optimizes business resource planning use cases such as vehicle routing, employee rostering and conference scheduling. The platform optimizes the goal of a problem based on limited resources under specific constraints. The engine is based on the upstream [OptaPlanner](http://www.optaplanner.org) project.

### Process Management
A high-performant, lightweight and scalable, BPMN2 compliant, process execution engine based on the open-source [jBPM](http://www.jbpm.org) project. Provides functionality like business process management, case management and human task management, to enable the automation and optimization of processes and cases.

### Business Central Console
A modern workbench that provides user the tooling to build business automation projects consisting of processes, rules, cases, and forms. Second, the workbench provides the management and monitoring functionality to build, deploy, run, manage and monitor business automation and process driven applications.

### Application Builder
A digital experience platform (DXP) concentrated on tooling to build process driven applications. The platform provides widgets and out-of-the-box components to build the user interfaces for your automation services.

<img src="../../assets/middleware/rhpam-7-workshop/rhpam-7-architecture.png" width="600" />

## Architectural components

### Business Central Authoring
To build and author the assets available in RHPAM, like rules, processes, cases, etc.

### Asset Repository
To be collaborative, all of the assets that you develop are stored in a Git based asset repository. This allows you to version, index, search and share your work with the rest of your team.

### Artifact Repository
Once you have completed the authoring phase and you are satisfied with the work you can package your assets into a _Deployment Unit_. This unit is a standard Java Archive (JAR) and will be stored in the artifact repository.

### Controller
The deployment units are deployed to the Execution Engine by the Controller. The Controller abstracts the complexity of the runtime environment through the use of so called _Templates_, or _Server Configurations_. This greatly reduces the complexity of managing clustered and/or heterogeneous topologies, for example topologies in which Execution Engines are deployed and managed per line of business.

### KIE Server
The lightweight, cloud-native, execution engine that runs the rules and processes contained in the deployment unit. KIE-Servers can be scaled horizontally and/or vertically in an automated fashion using the cloud native capabilities of OpenShift Container Platform. Since the state of the processes is stored in a persistent store (by default a relational database) you can consider the KIE-Servers to be stateless when it comes to process execution.

### Smart Router
Provides a runtime abstraction layer over the KIE-Server topology, allowing clients of this topology to interact with a single endpoint. Smart Router contains the information of which processes and rules (deployment units) are deployed on which runtime engine/KIE-Server, and provides routing functionality to the correct server instance based on the client request. In a classical enterprise environment where you have multiple instances running and different nodes, starting and shutting down in an elastic way, the complexity of tracking these changes in order to correctly load-balance the requests is the responsibility of the Smart Router.


For this course you will install an environment containing only the components needed to author, deploy, test and run your assets.
Because a critical capability of a digitally enabled product is to be available as a service, we are going to leverage  OpenShift Container Platform has a self-service console where you can choose the different tools needed depending on your skills, LOB and solution.
