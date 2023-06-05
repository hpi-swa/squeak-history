file services
fileReaderServicesForFile: fullName suffix: suffix

	^ suffix = 'mbox'
		ifTrue: [self services]
		ifFalse: [#()]