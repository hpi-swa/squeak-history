accessing - domain
attachmentAt: index
	"Note: Depending on the type of the mail, accessing attachments might be slow due to included network requests. See #attachmentNames for a faster alternative."

	^ self attachments at: index