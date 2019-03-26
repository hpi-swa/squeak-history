reading
allMessages

	| result |
	result := OrderedCollection new.
	[stream atEnd] whileFalse: [
		result add: self nextMessage].
	^ result