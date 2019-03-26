queries
countWordsIf: condition

	| words |
	words := Bag new.
	self messageRegularLinesDo: [:line |
		self class wordsIn: line do: [:word |
			(condition value: word) ifTrue: [
				words add: word asLowercase]]].
	^ words