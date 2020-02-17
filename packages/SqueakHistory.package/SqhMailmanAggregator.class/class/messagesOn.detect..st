preparation - message cache
messagesOn: listNames detect: detectBlock

	^ self
		messagesOn: listNames
		detect: detectBlock
		ifNone: [self error: 'Not found.']