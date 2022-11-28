instance creation
onFileNamed: fileName

	self flag: #decoding. "No UTF-8 decoding at this point. See comment in SqhMailWrapper>>#newFileStream."
	^ self on: (StandardFileStream readOnlyFileNamed: fileName)