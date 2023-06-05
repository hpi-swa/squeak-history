file services
exploreFileNamed: fileName

	^ (self onFileNamed: fileName do: #allMessages) explore