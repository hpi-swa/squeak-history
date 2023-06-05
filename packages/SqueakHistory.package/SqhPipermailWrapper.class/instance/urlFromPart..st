private
urlFromPart: part

	| start stop url |
	start := part findString: ('URL: ' copyWithFirst: Character lf).
	start = 0 ifTrue: [start := part findString: ('Url : ' copyWithFirst: Character lf)]. "used in an earlier version of pipermail"
	start > 0 ifTrue: [
		stop := part indexOfAnyOf: String crlf startingAt: start + 1.
		stop > 0 ifTrue: [
			url := part copyFrom: start + 6 to: stop - 1.
			(url first = $< and: [url last = $>]) ifTrue: [url := url copyFrom: 2 to: url size - 1].
			^ url asUrl]].
	
	^ nil