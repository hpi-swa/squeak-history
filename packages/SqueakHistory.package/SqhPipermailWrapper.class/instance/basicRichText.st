private
basicRichText

	self shouldAutoDownloadRichText ifTrue:
		[(self attachmentNames notEmpty and: [self attachmentNames first endsWithAnyOf: #('.html' '.htm')]) ifTrue: [
			^ (self attachmentAt: 1) bodyTextFormatted]].
	
	^ self basicPlainText