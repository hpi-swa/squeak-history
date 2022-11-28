instance creation
onFileNamed: fileName do: aBlock

	self flag: #decoding. "No UTF-8 decoding at this point. See comment in SqhMailWrapper>>#newFileStream."
	^ StandardFileStream
		readOnlyFileNamed: fileName
		do: [:stream | aBlock value: (self on: stream)]