preparation - conversations cache
resetCacheForMailInReplyTo
	
	| helperCache |	
	"0) Clear the cached in-reply-to field for all cached messages."
	self messages do: [:wrapper |
		wrapper removeProperty: #wrapperInReplyTo].

	"1) Set up a helper cache."
	helperCache := Dictionary new.
	self messages
		do: [:wrapper | 
			(helperCache
				at: wrapper listName
				ifAbsentPut: [Dictionary new])
					at: wrapper messageId put: wrapper]
		displayingProgress: [:w | 'Filling id-to-message cache ... ', (w messageId first: 5)].
	
	"2) Find and cache in-reply-to for all cached messages."
	self messages do: [:wrapper |
		wrapper mailMessageInReplyTo ifNotNil: [:messageId |
			wrapper setProperty: #wrapperInReplyTo toValue: ((helperCache
				at: wrapper listName)
				at: messageId
				ifAbsent: [
						| match |
						helperCache keysAndValuesDo: [:name :index |
							(index at: wrapper mailMessageInReplyTo ifAbsent: [])
								ifNotNil: [:w |
									Transcript showln: 'Cross-list conversation: ', wrapper listName, ' -> ', name.
									match := w]].
						match])]]
		displayingProgress: [:w | 'Linking in-reply-to messages ... ', (w messageId first: 5)].