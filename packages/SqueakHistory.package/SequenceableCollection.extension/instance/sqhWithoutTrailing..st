*SqueakHistory-converting
sqhWithoutTrailing: suffix

	^ (self endsWith: suffix)
		ifTrue: [self allButLast: suffix size]
		ifFalse: [self]