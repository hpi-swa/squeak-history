reading - index
getMessageFrom: start to: end

	self flag: #performance. "mt: #from: (or #new) is too expensive because of #initialize."
	^ MailMessage basicNew
		initializeFromString: (self getChunkFrom: start to: end);
		yourself