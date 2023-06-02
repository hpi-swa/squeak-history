enumerating - raw
allMessagesNormalizedDo: workBlock

	self messagesNormalizedDo: workBlock.
	
	self dateFilter ifNil: [^ self].
	self class cachedMessages do: [:wrapper | | mailMessage |
		mailMessage := MailMessage new.
		mailMessage fields
			at: 'squeak-mail-address' put: (wrapper valueOfProperty: #mailAddress);
			at: 'squeak-author-key' put: (wrapper valueOfProperty: #authorKey).
		workBlock value: mailMessage]