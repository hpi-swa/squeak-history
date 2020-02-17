as yet unclassified
conversationsFromTheLast: duration
	"The mails MUST BE sorted from newest to latest."
	
	| result |
	result := OrderedCollection new: 200.
	SqhMailmanAggregator conversationsOn: {self name} do: [:spec |
		(DateAndTime now - spec key dateAndTime) <= duration
			ifTrue: [result add: (DemoConversation from: spec)]].
	^ result