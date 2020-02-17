cache
named: aName

	KnownPersons ifNil: [KnownPersons := IdentityDictionary new].
	
	KnownPersons valuesDo: [:person |
		(person fullName
			includesSubstring: aName
			caseSensitive: false)
				ifTrue: [^ person]].
	
	self error: ('No person named ''{1}'' found.' format: {aName}).