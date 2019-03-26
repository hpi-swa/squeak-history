enumerating - raw
messagesNormalizedDo: workBlock
	"Normalizes the content of each messages before evaluating the workBlock."
	
	self rulesForAuthorKeyNormalizationDerived
		ifEmpty: [Warning signal: 'The author-key normalization is limited. Please run #deriveRulesForAuthorKeyNormalization.
			
If you are doing this right now, please ignore this warning.'].
	
	self messagesDo: [:mailMessage :listName |
		
		self normalizeDateAndTime: mailMessage.
		self normalizeMailAddress: mailMessage.
		
		self normalizeAuthor: mailMessage.
		self lookupAuthorInitials: mailMessage.
		
		workBlock cull: mailMessage cull: listName].