accessing - domain
isInReplyToValid
	"See SqhMailmanAggregator >> #resetCacheForMailConversations."
	
	| id w |
	id := self mailMessageInReplyTo.
	w := self inReplyTo.
	
	^ (w isNil and: [id isNil])
		or: [(w notNil and: [id notNil])
			and: [w messageId = id]]