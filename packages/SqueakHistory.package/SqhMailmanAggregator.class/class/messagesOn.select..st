preparation - message cache
messagesOn: listNames select: selectBlock

	| result |
	result := OrderedCollection new: 10.
	self messages
		do: [:ea | (listNames includes: ea listName)
			ifTrue: [(selectBlock value: ea) ifTrue: [result add: ea]]].
	^ result