enumerating - cached
messagesCachedDo: workBlock

	self
		with: (self class messagesOn: self mailingLists)
		do: [:wrapper | workBlock cull: wrapper].