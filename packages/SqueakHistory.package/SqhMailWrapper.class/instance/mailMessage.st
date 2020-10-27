accessing - raw
mailMessage
	
	^ mailMessage ifNil: [(SqhMBoxReadWriter on: self fileStream)
		getMessageFrom: self fileStart to: self fileEnd]