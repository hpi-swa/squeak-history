reading
nextChunk
	"Returns the content for the next mail message. Skips the next separator first."

	| result separator |
	result := OrderedCollection new.
	
	lastStart := nil.
	lastEnd := nil.
	
	separator := self skipSeparator.

	[self isNextLineSeparator or: [stream atEnd]] whileFalse: [
		result add: self nextLine].	

	lastEnd := stream position.

	^ ({'separator: ', separator}, result)
		joinSeparatedBy: String cr