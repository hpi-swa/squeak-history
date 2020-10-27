accessing - convenience
mailsFromTimespan: timespan
	"self mailsFromTimespan: (1998 asYear to: 1999 asYear)"
	
	^ self mails select: [:mail | timespan includes: mail dateAndTime]