instance creation
onFileNamed: fileName do: aBlock

	^ StandardFileStream
		readOnlyFileNamed: fileName
		do: [:stream | aBlock value: (self on: stream)]