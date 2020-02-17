preparation - conversations cache
conversations

	^ CachedConversations ifNil: [self resetCacheForMailConversations. CachedConversations]