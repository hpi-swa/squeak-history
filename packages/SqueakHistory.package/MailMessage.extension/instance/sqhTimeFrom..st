*SqueakHistory-parsing-backport
sqhTimeFrom: aString 
	"Parse the date and time (rfc822) and answer the result as the number of seconds 
	since the start of 1980."

	| s t rawDelta delta plusOrMinus |
	s := ReadStream on: aString.

	"date part"
	t := ((self readDateFrom: s) ifNil: [Date today]).
	
	(aString size > 5 and: [(aString atLast: 5) = $  and: [aString last isDigit and: [(aString atLast: 2) isDigit] and: [(aString atLast: 3) isDigit] and: [(aString atLast: 4) isDigit]]]) ifTrue: [
		"asctime format - not covered by rfc822, but used in mboxes, such as the earlier years of http://lists.squeakfoundation.org/pipermail/squeak-dev/"
		| year |
		year := Integer readFrom: (aString last: 4) readStream.
		year >= 1900 "not just a timezone without trailing +" ifTrue:
			[t := t dayMonthYearDo: [:d :m :y | Date year: year month: m day: d].
			[s peekBack isDigit] whileTrue: [s skip: -1].
			s := (aString allButLast: 5) readStream position: s position; yourself]].
	
	t := t asSeconds.
	
	[s atEnd or: [s peek isAlphaNumeric]]
		whileFalse: [s next].

	"time part"
	s atEnd ifFalse: ["read time part (interpreted as local, regardless of sender's timezone)"
		(s peek isDigit) ifTrue: [t := t + (Time readFrom: s) asSeconds].
		].
	s skipSeparators.

	"Check for a numeric time zone offset"
	('+-' includes: s peek) ifTrue: 
		[plusOrMinus := s next.
		rawDelta := (s peek isDigit) ifTrue: [Integer readFrom: s] ifFalse: [0].
		delta := (rawDelta // 100 * 60 + (rawDelta \\ 100)) * 60.
		t := plusOrMinus = $+ ifTrue: [t - delta] ifFalse: [t + delta]].

	"We ignore text time zone offsets like EST, GMT, etc..."

	^ t - (Date newDay: 1 year: 1980) asSeconds

"MailMessage new timeFrom: 'Thu, 22 Jun 2000 14:17:47 -500'"
"MailMessage new timeFrom: 'Thu, 22 Jun 2000 14:17:47 --500'"
"MailMessage new timeFrom: 'on, 04 apr 2001 14:57:32'"