reading - index
getMessageFrom: start to: end

	self flag: #performance. "mt: #from: (or #new) is too expensive because of #initialize."
	self flag: #decoding. "MailMessage insists on doing some default us-ascii conversion itself in MIMEDocument>>#asSendableBodyText (sent during SqhMailWrapper>>#bodyText). This would break if we decoded the file which is encoded in UTF-8 format, so decoding was defered to SqhMailWrapper>>#decode: instead. If we could disable the decoding stage inside MailMessage, however, it would be cleaner to move this reponsibility to the file stream."
	^ MailMessage basicNew
		initializeFromString: (self getChunkFrom: start to: end);
		yourself