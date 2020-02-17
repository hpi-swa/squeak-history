cache
at: key

	KnownPersons ifNil: [KnownPersons := IdentityDictionary new].
	
	^ KnownPersons
		at: key
		ifAbsent: [self error: ('No person with key ''{1}'' found.' format: {key})]