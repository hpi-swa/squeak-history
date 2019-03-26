enumerating - cached
messagesCachedDo: workBlock

	self with: self class messages do: [:wrapper |
		
		self flag: #todo. "mt: filter for mailing lists."
		"(self mailingLists includes: wrapper listName)
			ifTrue: [ ... ]."

		workBlock cull: wrapper."
			cull: wrapper mailMessage
			cull: wrapper listName
			cull: wrapper"].