preparation - message cache
messagesOn: listNames

	^ self messages select: [:ea | listNames includes: ea listName]