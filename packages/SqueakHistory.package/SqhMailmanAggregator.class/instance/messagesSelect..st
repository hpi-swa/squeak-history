enumerating - raw
messagesSelect: block

	| messages |
	messages := OrderedCollection new.
	
	self messagesNormalizedDo: [:mailMessage :listName |
		(block cull: mailMessage cull: listName)
			ifTrue: [messages add: mailMessage]].
	
	^ messages