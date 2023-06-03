accessing - domain
attachmentNames

	^ self valueOfProperty: #attachmentNames ifAbsentPut: [
		self basicAttachmentNames]