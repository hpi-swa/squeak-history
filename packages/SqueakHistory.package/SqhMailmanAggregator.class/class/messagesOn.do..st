preparation - message cache
messagesOn: listNames do: workBlock

	self messages
		do: [:ea | (listNames includes: ea listName)
			ifTrue: [workBlock value: ea]].