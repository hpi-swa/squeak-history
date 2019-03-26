streaming
peekLines: number

	| result consumed |
	result := OrderedCollection new.
	consumed := 0.
	
	number timesRepeat: [
		stream atEnd ifFalse: [
			
			result addLast: (stream upToAnyOf: CharacterSet crlf do: [:char |
				consumed := consumed + 1.
				char = Character cr ifTrue: [
					(stream peekFor: Character lf)
						ifTrue: [consumed := consumed + 1]].
				char = Character lf ifTrue: [
					(stream peekFor: Character cr)
						ifTrue: [consumed := consumed + 1]]]).
			consumed := consumed + result last size]].
	
	stream position: stream position - consumed.
	
	^ result