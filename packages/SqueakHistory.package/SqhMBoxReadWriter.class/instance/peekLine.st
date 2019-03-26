streaming
peekLine

	^ (self peekLines: 1)
		ifEmpty: [nil]
		ifNotEmpty: [:lines | lines first]