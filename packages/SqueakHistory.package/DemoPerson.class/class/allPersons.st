cache
allPersons
	^ KnownPersons ifNil: [#()] ifNotNil: [:p | p values]