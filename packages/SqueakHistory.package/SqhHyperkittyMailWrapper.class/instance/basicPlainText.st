private
basicPlainText

	| message |
	self flag: #workaround. "HyperKitty invalidates the structure of message parts. All message formats (plaintext and HTML) and attachments are incorrectly grouped in a flat multipart/mixed document."
	
	message := self mailMessage.
	(message body contentType = 'multipart/mixed' and: [message parts first isPlaintext]) ifTrue: [
		"HyperKitty"
		| text |
		text := message parts first text.
		self flag: #workaround. "HyperKitty doubly-encodes some plaintext messages in utf-8."
		^ [text utf8ToSqueak] ifError: [text]].
	
	^ super basicPlainText