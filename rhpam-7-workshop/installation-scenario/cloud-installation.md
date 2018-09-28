Red Hat Process Automation Manager is part of a rich set of tools to develop enterprise solution with multiple capabilities, thought to support multidisciplinary teams with teh right tool for every task a hand.

The native cloud environment was already provisioned for you, you can access it either using a terminal y you are a developer:
So for example you can log in as developer `oc login -u developer -p developer`{{execute}}


Additional Markdown Syntax
Katacoda has added extended markdown

Markdown Example
Terminal Integration
Allow a code block to be executed `some-command`{{execute}}

For multiple terminals, execute the command on HOST1 `some-command`{{execute HOST1}}
For multiple terminals, execute the command on HOST2 `some-command`{{execute HOST2}}

For multiple terminals, execute the command on T1 `some-command`{{execute T1}}
For multiple terminals, execute the command on T2 `some-command`{{execute T2}}

Allow a code block to be copied `some-command`{{copy}}

Editor Integration

<pre class="file" data-filename="app.js" data-target="replace">var http = require('http');
var requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

var server = http.createServer(requestListener);
server.listen(3000, function() { console.log("Listening on port 3000")});
</pre>


<pre class="file" data-target="clipboard">Test</pre>


<pre class="file" data-target="regex???">Test</pre>
