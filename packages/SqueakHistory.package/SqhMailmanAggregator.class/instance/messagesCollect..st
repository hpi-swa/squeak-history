enumerating - raw
messagesCollect: block

	| objects |
	objects := OrderedCollection new.
	
	self messagesNormalizedDo: [:mailMessage :listName |
		objects add: (block cull: mailMessage cull: listName)].
	
	^ objects