as yet unclassified
markAllUnread

	SqhMailmanAggregator
		messagesOn: {self name}
		do: [:wrapper | wrapper setProperty: #unread toValue: true]