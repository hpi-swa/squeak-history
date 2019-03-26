as yet unclassified
mailMessage

	self flag: #todo. "mt: Use inst var mailMessage as cache."
	
	^ (SqhMBoxReadWriter on: self fileStream)
		getMessageFrom: self fileStart to: self fileEnd