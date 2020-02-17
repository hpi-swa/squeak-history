properties
valueOfProperty: aSymbol ifAbsentPut: aBlock

	^ self assureProperties
		at: aSymbol
		ifAbsentPut: aBlock