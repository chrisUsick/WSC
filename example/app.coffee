
http = require("http")
connect = require("connect")

WebSocketServer = require('ws').Server

WSC = require('../WSC.js')
Convos = require('./Convos.js').convos

source = connect().use(connect.static (__dirname + '/'))
server = http.createServer(source).listen 3000, ->
  console.log " server listening"

wss = new WebSocketServer({server: server})
wss.on "connection", (ws) ->
	console.log "client connected to wss"
	wsc = new WSC.WSC(ws)
	console.log Convos
	wsc.addConversations Convos 

	ws.on 'message', (data, flags) -> 
		msg = JSON.parse data
		wsc.onmessage(msg)

