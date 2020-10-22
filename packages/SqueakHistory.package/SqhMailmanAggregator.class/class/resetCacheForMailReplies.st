preparation - conversations cache
resetCacheForMailReplies
	"Is faster when all in-reply-to fields are cached."
	
	| helperCache |	
	"0) Clear the cached replies for all cached messages."
	self messages do: [:wrapper |
		wrapper removeProperty: #wrapperReplies].

	"1) Set up a helper cache."
	helperCache := IdentityDictionary new.
	self messages
		do: [:wrapper | wrapper inReplyTo ifNotNil: [:inReplyTo | 
			(helperCache
				at: inReplyTo
				ifAbsentPut: [OrderedCollection new])
					add: wrapper]]
		displayingProgress: [:w | 'Filling replies cache ... ', (w messageId first: 5)].
	
	"2) Find and cache in-reply-to for all cached messages."
	self messages do: [:wrapper |
		wrapper
			setProperty: #wrapperReplies
			toValue: (helperCache at: wrapper ifAbsent: [#()])]