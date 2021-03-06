class WSC 
	constructor: (@ws) ->

	conversations: []
	onmessage: (msg) -> 
		# (() -> )(con) for con in @conversations
		con = (@conversations.filter (c) -> c.name == msg.request)[0]
		console.log con 
		@ws.send JSON.stringify(
			response: con.name
			data:con.respond(msg.data)
		)
	addConversations: (cons) -> @conversations = @conversations.concat cons

class Conversation
	constructor: (@name, @respond) ->
		return @
	# respond: (data) -> 
	# setResponse: (fn) -> @respond = fn

###
con.name = 'helloWorld'
con.respond = (data) -> {response:'helloWorld', data:'hello world!'}
###

# send an object with each class constructor
exports.WSC = WSC
exports.Conversation = Conversation

