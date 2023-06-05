private
nameFromPart: part

	| start stop |
	start := part findString: ('Name: ' copyWithFirst: Character lf).
	start > 0 ifTrue: [
		stop := part indexOf: Character lf startingAt: start + 1.
		stop > 0 ifTrue: [
			^ part copyFrom: start + 7 to: stop - 1]].
	
	^ nil