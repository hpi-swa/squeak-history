accessing - convenience
first: n

	| messages |
	messages := OrderedCollection new.
	
	self messagesNormalizedDo: [:mailMessage |
		messages add: mailMessage.
		messages size = n ifTrue: [^ messages]].
	
	^ messages