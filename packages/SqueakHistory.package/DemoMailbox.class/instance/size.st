as yet unclassified
size

	^ size ifNil: [size := (SqhMailmanAggregator messagesOn: {self name}) size]