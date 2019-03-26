streaming
nextLine

	^ (self nextLines: 1)
		ifEmpty: [nil]
		ifNotEmpty: [:lines | lines first]