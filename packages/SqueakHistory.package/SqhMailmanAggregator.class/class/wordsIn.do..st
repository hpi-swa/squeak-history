support
wordsIn: aTextLine do: workBlock

	| stops position word start |
	stops := CharacterSet withAll: ' 	,;.:-_#''"~+*<>|!?^$%&/\()[]{}=0123456789@'.
	position := 1.
	start := 0.
	[position < aTextLine size] whileTrue: [
		(stops includes: (aTextLine at: position))
			ifFalse: [
				start := position.
				position := position + 1.
				[start > 0 and: [position < aTextLine size]] whileTrue: [
					(stops includes: (aTextLine at: position))
						ifTrue: [
							word := aTextLine copyFrom: start to: position-1.
							position := position + 1.
							workBlock value: word.
							start := 0]
						ifFalse: [position := position + 1]]]
			ifTrue: [position := position + 1]].

	"Last word?"
	start > 0 ifTrue: [workBlock value: (aTextLine copyFrom: start to: position-1)].