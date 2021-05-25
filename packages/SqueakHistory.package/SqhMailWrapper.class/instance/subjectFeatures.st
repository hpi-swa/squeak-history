accessing - domain
subjectFeatures

	^ self
		valueOfProperty: #subjectFeatures
		ifAbsentPut: [self subject findFeatures]