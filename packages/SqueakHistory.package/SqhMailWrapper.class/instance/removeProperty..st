properties
removeProperty: aSymbol

	properties ifNil: [^ self].
	properties removeKey: aSymbol ifAbsent: [].