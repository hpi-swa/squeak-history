accessing - domain
inReplyTo
	"SqhMailmanAggregator messages count: [:ea | ea inReplyTo notNil]"

	"An extra look-up cache is faster here.
	
	Smalltalk at: #TempMessageCache put: Dictionary new.
	((Smalltalk at: #TempMessageCache) collect: [:ea | ea size]) sum.

	SqhMailmanAggregator messages
		do: [:w | 
			((Smalltalk at: #TempMessageCache)
				at: w listName
				ifAbsentPut: [Dictionary new])
					at: w messageId put: w]
		displayingProgress: [:w | w]."
	
	self mailMessageInReplyTo ifNil: [^ nil].
	
	^ self
		valueOfProperty: #wrapperInReplyTo
		ifAbsentPut: [
			
			"((Smalltalk at: #TempMessageCache)
				at: self listName)
				at: self mailMessageInReplyTo
				ifAbsent: [
					| match |
					(Smalltalk at: #TempMessageCache) keysAndValuesDo: [:name :index |
						(index at: self mailMessageInReplyTo ifAbsent: [])
							ifNotNil: [:w |
								Transcript showln: 'Cross-list conversation: ', self listName, ' -> ', name.
								match := w]].
					match]."
			
			SqhMailmanAggregator messages
				detect: [:wrapper | wrapper mailMessageMessageId = self mailMessageInReplyTo]
				ifNone: [nil].
			]