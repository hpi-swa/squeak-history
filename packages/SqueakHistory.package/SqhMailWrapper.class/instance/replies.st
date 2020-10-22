accessing - domain
replies
		
	^ self
		valueOfProperty: #wrapperReplies
		ifAbsentPut: [
			SqhMailmanAggregator messages
				select: [:wrapper | wrapper inReplyTo == self]]