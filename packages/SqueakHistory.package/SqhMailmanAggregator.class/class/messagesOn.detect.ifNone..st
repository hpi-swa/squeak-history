preparation - message cache
messagesOn: listNames detect: detectBlock ifNone: errorBlock

	^ self messages
		detect: [:ea | (listNames includes: ea listName) and: [detectBlock value: ea]]
		ifNone: errorBlock