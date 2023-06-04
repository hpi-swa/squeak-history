initialize-release
clearAllCaches

	self flag: #discuss. "Should we reuse downloaded files after clearing caches? Currently we just overwrite them, and for HyperKitty, we often might define different chunks and leave dangling files behind."
	CachedConversations := CachedMessages := RulesForAuthorKeyNormalizationDerived := nil