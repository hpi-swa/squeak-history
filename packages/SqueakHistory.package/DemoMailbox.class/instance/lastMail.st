as yet unclassified
lastMail
	"The mails MUST BE sorted from newest to latest."
	
	^ SqhMailmanAggregator messages
		detect: [:w | w listName = self name]	