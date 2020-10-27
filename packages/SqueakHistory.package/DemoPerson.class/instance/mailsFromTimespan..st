accessing - convenience
mailsFromTimespan: timespan
	"self mailsFromTimespan: (1998 asYear to: 1999 asYear)"
	
	| authorKey |
	authorKey := self authorKey.
	
	^ SqhMailmanAggregator messages
		select: [:wrapper | wrapper authorKey = authorKey and: [timespan includes: wrapper dateAndTime]]
		thenCollect: [:wrapper | DemoMail on: wrapper]
		
	"^ self mails select: [:mail | timespan includes: mail dateAndTime]"