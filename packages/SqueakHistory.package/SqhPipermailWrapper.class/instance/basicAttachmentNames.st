private
basicAttachmentNames

	^ self basicParts allButFirst collect: [:part |
		((self nameFromPart: part) ifNil: [(self urlFromPart: part) ifNotNil: #fileName])
			ifNil: ['name not available']]