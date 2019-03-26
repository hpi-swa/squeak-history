as yet unclassified
onFileNamed: fileName

	^ self on: (StandardFileStream readOnlyFileNamed: fileName)