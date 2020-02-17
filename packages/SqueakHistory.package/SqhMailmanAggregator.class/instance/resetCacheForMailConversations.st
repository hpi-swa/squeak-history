preparation - conversations cache
resetCacheForMailConversations
	
	CachedConversations := Dictionary new: 5000.
	
	self messagesCachedDo: [:wrapper |
		(CachedConversations
			at: wrapper inReplyToFirst
			ifAbsentPut: [Set new])
				add: wrapper].
	
	CachedConversations keys do: [:startId |
		CachedConversations
			at: startId
			put: ((CachedConversations at: startId) sorted: [:a :b | a dateAndTime > b dateAndTime])].