cache
allNamed: aName

	| result |
	KnownPersons ifNil: [KnownPersons := IdentityDictionary new].
	
	result := OrderedCollection new.
	KnownPersons valuesDo: [:person |
		(person fullName
			includesSubstring: aName
			caseSensitive: false)
				ifTrue: [result add: person]].
	
	^ result