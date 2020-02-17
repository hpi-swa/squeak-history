as yet unclassified
mailsFromTheLast: duration
	"The mails MUST BE sorted from newest to latest."
	
	| result |
	result := OrderedCollection new: 200.
	SqhMailmanAggregator messagesOn: {self name} do: [:wrapper |
		(DateAndTime now - wrapper dateAndTime) > duration
			ifTrue: [^ result].
		result add: (DemoMail on: wrapper)].
	^ result