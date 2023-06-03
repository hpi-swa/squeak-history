*SqueakHistory-accessing-backport
sqhTime
	| dateField |
	dateField := (self fieldNamed: 'date' ifAbsent: [ ^0 ]) mainValue.
	^ [self sqhTimeFrom: dateField] ifError: [:err :rcvr | (Date today - (Date newDay: 1 year: 1980)) asSeconds].