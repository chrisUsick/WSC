Con = require('../WSC.js').Conversation

exports.convos = [
	new Con 'helloWorld', (data) -> 
		return 'hello world ' + data
	new Con 'returnEvens', (data) -> data.filter (i) -> (i % 2) == 0
]
# console.log exports.convos

