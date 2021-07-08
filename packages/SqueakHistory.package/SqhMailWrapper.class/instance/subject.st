accessing - domain
subject

	^ self valueOfProperty: #subject ifAbsentPut: [
		self decode: self mailMessage subject]