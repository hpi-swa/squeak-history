accessing - domain
replies
	"For a more efficient caching, see SqhMailmanAggregator class >> #resetCacheForMailReplies."
	
	^ self
		valueOfProperty: #wrapperReplies
		ifAbsentPut: [
			SqhMailmanAggregator messages
				select: [:wrapper | wrapper inReplyTo == self]]