as yet unclassified
subjectFeatures

	^ self
		valueOfProperty: #subjectFeatures
		ifAbsentPut: [self subject findFeatures]