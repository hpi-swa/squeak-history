accessing - raw
mailMessageMessageId

	^ self
		valueOfProperty: #messageId
		ifAbsentPut: [
			self mailMessage messageId
				ifEmpty: [ '<{1}@generated>' format: {UUID new asString}]
				ifNotEmpty: [:id | 	self fixMessageId: id]]