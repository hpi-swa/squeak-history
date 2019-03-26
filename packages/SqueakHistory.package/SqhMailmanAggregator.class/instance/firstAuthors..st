accessing - convenience
firstAuthors: n

	| messages |
	messages := OrderedCollection new.
	
	self messagesNormalizedDo: [:mailMessage |
		messages add: mailMessage from.
		messages size = n ifTrue: [^ messages]].
	
	^ messages