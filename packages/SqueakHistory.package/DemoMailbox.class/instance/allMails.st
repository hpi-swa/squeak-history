as yet unclassified
allMails

	^ (SqhMailmanAggregator messagesOn: {self name})
		collect: [:wrapper | DemoMail on: wrapper]