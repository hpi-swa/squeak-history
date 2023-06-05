accessing - domain
subject

	^ self valueOfProperty: #subject ifAbsentPut: [
		self basicSubject]