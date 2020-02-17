as yet unclassified
subject

	^ self
		valueOfProperty: #subject
		ifAbsentPut: [[self mailMessage subject utf8ToSqueak] on: Error do: [:ex | self mailMessage subject]]