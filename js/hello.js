var system = require('system'),
    env = system.env;

var server, service;

server = require('webserver').create();

var page = require('webpage').create();

page.open('http://google.com/', function (status) {
  if (status !== 'success')
    console.log('FAIL to load the address');
	else
		window.setTimeout(
			function () {
				page.render('google.png');
      }, 200);
});

var fs = require('fs');

service = server.listen(env.VCAP_APP_PORT, function (request, response) {
    response.statusCode = 200;
		response.setHeader('Content-Type', 'image/png');
    response.write(fs.read('google.png', 'b'));
    response.close();
});
