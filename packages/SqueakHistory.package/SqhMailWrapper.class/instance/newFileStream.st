accessing - raw
newFileStream

	self flag: #decoding. "We know the files have UTF-8 encoding, but we don't use a MultiByteFileStream (as returned by FileStream>>#readOnlyFileNamed:) here because MailMessage insists on doing the conversion itself. See also comment in SqhMBoxReadWriter>>#getMessageFrom:to:."
	^ StandardFileStream readOnlyFileNamed: fileName