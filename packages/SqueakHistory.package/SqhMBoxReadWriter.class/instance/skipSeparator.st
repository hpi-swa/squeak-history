reading
skipSeparator
	"Consume the contents up to (and including) the next separator."

	[self isNextLineSeparator
		ifTrue: [
			lastStart := stream position.
			^ self nextLine]
		ifFalse: [self nextLine. stream atEnd]] whileFalse.
	
	^ nil