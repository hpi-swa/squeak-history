as yet unclassified
printOn: stream

	stream nextPutAll: self fullName.
	stream nextPut: $<; nextPutAll: self authorKey; nextPut: $>