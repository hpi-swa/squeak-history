as yet unclassified
printOn: stream

	stream
		nextPutAll: 'MailWrapper';
		nextPutAll: (self messageId truncateWithElipsisTo: 20);
		nextPut: $>.