private
basicRichText

	| message |
	self flag: #workaround. "HyperKitty invalidates the structure of message parts. All message formats (plaintext and HTML) and attachments are incorrectly grouped in a flat multipart/mixed document. The HTML message is incorrectly provided as an attachment. See: https://gitlab.com/mailman/hyperkitty/-/issues/474#issue-1"
	
	message := self mailMessage.
	(message body contentType = 'multipart/mixed' and: [message parts first isPlaintext] and: [message parts size >= 2] and: [message parts second sqhContentDisposition = 'attachment'] and: [message parts second isHTML]) ifTrue: [
		| part |
		part := message parts second.
		self flag: #workaround. "HyperKitty does not specify the charset, for which it always uses utf-8. See: https://gitlab.com/mailman/hyperkitty/-/issues/474#issue-3"
		"Note: In some instances, the correct charset can and should be retrieved from the <meta> tags of the HTML file. However, HtmlReadWriter is not aware of this (yet)."
		part contentTypeHeaderValue parameterAt: #charset ifAbsent: [
			part content: (part class tryToDecodeBody: part content as: 'utf-8')].
		^ part bodyTextFormatted].
	
	^ super basicRichText