accessing - convenience
conversation

	^ DemoConversation from: (SqhMailmanAggregator conversations
		associationAt: self wrapper inReplyToFirst)