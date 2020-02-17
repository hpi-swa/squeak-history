accessing - raw
mailMessageMessageId

	^ self
		valueOfProperty: #messageId
		ifAbsentPut: [self mailMessage messageId]