as yet unclassified
printOn: stream

	self subject
		ifEmpty: [	stream nextPutAll: self wrapper messageId]
		ifNotEmpty: [:s | stream nextPutAll: s]