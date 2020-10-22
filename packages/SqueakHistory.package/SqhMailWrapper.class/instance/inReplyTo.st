accessing - domain
inReplyTo
	"SqhMailmanAggregator messages count: [:ea | ea inReplyTo notNil]"
	
	self mailMessageInReplyTo ifNil: [^ nil].
	
	^ self
		valueOfProperty: #wrapperInReplyTo
		ifAbsentPut: [
			SqhMailmanAggregator messages
				detect: [:wrapper | wrapper mailMessageMessageId = self mailMessageInReplyTo]
				ifNone: [nil].
			]