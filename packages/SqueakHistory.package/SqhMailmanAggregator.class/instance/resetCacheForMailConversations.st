preparation - conversations cache
resetCacheForMailConversations
	
	| tmp |
	tmp := Dictionary new: 5000.
	
	self messagesCachedDo: [:wrapper |
		(tmp
			at: wrapper inReplyToFirst
			ifAbsentPut: [Set new])
				add: wrapper].

	CachedConversations := OrderedDictionary new: 5000.	
	(tmp keys sorted: [:a :b | a dateAndTime >= b dateAndTime])
		do: [:startId |
			CachedConversations
				at: startId
				put: ((tmp at: startId) sorted: [:a :b | a dateAndTime >= b dateAndTime])].