preparation - conversations cache
conversations

	^ CachedConversations ifNil: [
		self resetCacheForMailInReplyTo.
		self resetCacheForMailReplies.
		self resetCacheForMailConversations.
		CachedConversations]