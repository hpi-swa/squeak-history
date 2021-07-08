accessing - domain
bodyText

	^ self valueOfProperty: #bodyText ifAbsentPut: [
		self decode: self mailMessage bodyText]