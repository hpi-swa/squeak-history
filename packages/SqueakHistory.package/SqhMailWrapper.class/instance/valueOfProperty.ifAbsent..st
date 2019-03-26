properties
valueOfProperty: aSymbol ifAbsent: aBlock

	properties ifNil: [^ aBlock value].
	^ properties at: aSymbol ifAbsent: aBlock