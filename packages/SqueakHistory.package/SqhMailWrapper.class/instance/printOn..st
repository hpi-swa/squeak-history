printing
printOn: stream

	super printOn: stream.
	stream
		nextPutAll: (self messageId truncateWithElipsisTo: 20);
		nextPut: $>.