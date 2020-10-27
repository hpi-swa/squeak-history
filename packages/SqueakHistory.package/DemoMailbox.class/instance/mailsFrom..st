as yet unclassified
mailsFrom: aPerson

	^ self allMails select: [:m | m sender = aPerson]