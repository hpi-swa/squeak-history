preparation - message cache
messages

	^ CachedMessages ifNil: [self resetCacheForMailMessages. CachedMessages]