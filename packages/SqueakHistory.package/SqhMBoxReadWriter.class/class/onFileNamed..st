instance creation
onFileNamed: fileName

	^ self on: (StandardFileStream readOnlyFileNamed: fileName)