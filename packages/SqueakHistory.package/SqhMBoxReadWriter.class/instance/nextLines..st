streaming
nextLines: number

	| result |
	result := OrderedCollection new.
		
	number timesRepeat: [
		stream atEnd ifFalse: [
			result addLast: (stream upToAnyOf: CharacterSet crlf do: [:char |
				char = Character cr ifTrue: [stream peekFor: Character lf].
				char = Character lf ifTrue: [stream peekFor: Character cr]])]].
	
	^ result