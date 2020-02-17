as yet unclassified
allConversations

	^ (SqhMailmanAggregator conversationsOn: {self name})
		associations collect: [:spec | DemoConversation from: spec]