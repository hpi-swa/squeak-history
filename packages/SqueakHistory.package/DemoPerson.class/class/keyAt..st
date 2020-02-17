cache
keyAt: person

	KnownPersons ifNil: [KnownPersons := IdentityDictionary new].
	
	^ KnownPersons keyAtValue: person