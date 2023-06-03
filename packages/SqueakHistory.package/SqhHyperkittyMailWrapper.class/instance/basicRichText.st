private
basicRichText

	| message |
	self flag: #workaround. "HyperKitty invalidates the structure of message parts. All message formats (plaintext and HTML) and attachments are incorrectly grouped in a flat multipart/mixed document. The HTML message is incorrectly provided as an attachment."
	
	message := self mailMessage.
	(message respondsTo: #bodyTextFormattedRich) ">= Network-ct.270"
		ifFalse: [^ super basicRichText].
	(message body contentType = 'multipart/mixed' and: [message parts first isPlaintext] and: [message parts size >= 2] and: [message parts second contentDisposition = 'attachment'] and: [message parts second isHTML]) ifTrue: [
		| part |
		part := message parts second.
		self flag: #workaround. "HyperKitty does not specify the charset, for which it always uses utf-8."
		"Note: In some instances, the correct charset can and should be retrieved from the <meta> tags of the HTML file. However, HtmlReadWriter is not aware of this (yet)."
		part contentTypeHeaderValue parameterAt: #charset ifAbsent: [
			part content: (part class tryToDecodeBody: part content as: 'utf-8')].
		^ part bodyTextFormattedRich].
	
	^ super basicRichText