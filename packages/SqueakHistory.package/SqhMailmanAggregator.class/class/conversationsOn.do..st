preparation - conversations cache
conversationsOn: listNames do: workBlock

	self conversations keys
		select: [:starter | listNames includes: starter listName]
		thenDo: [:starter | workBlock value: starter -> (self conversations at: starter)].