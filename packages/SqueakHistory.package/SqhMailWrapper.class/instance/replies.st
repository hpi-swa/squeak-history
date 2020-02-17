accessing - domain
replies
	"An extra look-up cache is faster here.
	
	Smalltalk at: #TempMessageCache put: IdentityDictionary new.
	(Smalltalk at: #TempMessageCache) size.
	((Smalltalk at: #TempMessageCache) select: [:ea | ea size > 1]) size.

	SqhMailmanAggregator messages
		do: [:w | w inReplyTo ifNotNil: [
			((Smalltalk at: #TempMessageCache)
				at: w inReplyTo
				ifAbsentPut: [OrderedCollection new])
					add: w]]
		displayingProgress: [:w | w]."
		
	^ self
		valueOfProperty: #wrapperReplies
		ifAbsentPut: [
			"(Smalltalk at: #TempMessageCache)
				at: self
				ifAbsent: [#()]."
				
			SqhMailmanAggregator messages
				select: [:wrapper | wrapper inReplyTo == self]]