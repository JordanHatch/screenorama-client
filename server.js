var tty = require('tty.js');
var spawn = require('child_process').spawn;

// Simple tty.js in app mode
var app = tty.createServer({
  shell: 'bash',
  users: {
    admin: 'admin'
  },
  port: process.env.PORT
});
var newProcess = spawn('/app/spawn_screen',[''],
			{
			    detached: true
			    // stdio: [ 'ignore', 'ignore', 'ignore' ]
			}
			);
newProcess.stderr.pipe(process.stderr);
newProcess.stdout.pipe(process.stdout);

app.listen();
