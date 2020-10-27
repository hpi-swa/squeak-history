preparation - message cache
messagesOn: listNames collect: collectBlock

	| result |
	result := OrderedCollection new: 10.
	self messages
		do: [:ea | (listNames includes: ea listName)
			ifTrue: [result add: (collectBlock value: ea)]].
	^ result