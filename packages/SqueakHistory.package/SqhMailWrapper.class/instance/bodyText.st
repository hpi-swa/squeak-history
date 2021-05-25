accessing - domain
bodyText

	^ self
		valueOfProperty: #bodyText
		ifAbsentPut: [self mailMessage bodyText utf8ToSqueak]