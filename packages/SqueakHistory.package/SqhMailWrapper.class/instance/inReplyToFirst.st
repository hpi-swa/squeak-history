accessing - domain
inReplyToFirst
	"Return the first message in this conversation."
	
	| conversationStarter next |
	conversationStarter := self.
	[(next := conversationStarter inReplyTo) notNil]
		whileTrue: [conversationStarter := next].
		
	^ conversationStarter