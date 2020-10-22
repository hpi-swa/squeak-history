properties
setProperty: aSymbol toValue: anObject
	"Note that we must not remove the property for 'nil' values because it is important for the cache. See #inReplyTo as an example."
	
	self assureProperties at: aSymbol put: anObject.