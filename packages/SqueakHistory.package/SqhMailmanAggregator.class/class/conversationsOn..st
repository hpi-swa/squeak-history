preparation - conversations cache
conversationsOn: listNames

	^ Dictionary newFrom: (self conversations keys
		select: [:starter | listNames includes: starter listName]
		thenCollect: [:starter | starter -> (self conversations at: starter)])