properties
setProperty: aSymbol toValue: anObject

	anObject ifNil: [^ self removeProperty: aSymbol].
	self assureProperties at: aSymbol put: anObject.