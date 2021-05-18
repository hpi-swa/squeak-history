enumerating - raw
messagesNormalizedDo: workBlock
	"Normalizes the content of each messages before evaluating the workBlock."

	self rulesForAuthorKeyNormalizationDerived ifEmpty: [
		(thisContext findContextSuchThat: [:ctx | ctx selector = #deriveRulesForAuthorKeyNormalization]) ifNil: [
			self notify: 'The author-key normalization is limited. Please run #deriveRulesForAuthorKeyNormalization.']].
	
	self messagesDo: [:mailMessage :listName |
		self normalizeDateAndTime: mailMessage.
		self normalizeMailAddress: mailMessage.
		
		self normalizeAuthor: mailMessage.
		self lookupAuthorInitials: mailMessage.
		
		workBlock cull: mailMessage cull: listName]