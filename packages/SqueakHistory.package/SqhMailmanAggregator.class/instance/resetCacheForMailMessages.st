preparation - message cache
resetCacheForMailMessages
	"Create instances of MailmanMailMessage to function as wrappers around MailMessage for quick access."

	| wrappers |
	(self environment classNamed: #DemoPerson)
		ifNotNil: [:c | c forgetAllPersons].
	CachedConversations := nil.
	
	wrappers := CachedMessages
		ifNil: [Dictionary new: 200000]
		ifNotNil: [:messages | messages collect: [:message | message messageId -> message] as: Dictionary].
	
	self
		messagesNormalizedDo: [:mailMessage :listName | | newWrapper |
			newWrapper := SqhMailWrapper from: mailMessage.
			wrappers at: newWrapper messageId ifAbsentPut: [
				newWrapper
					setProperty: #listName toValue: listName;
					setProperty: #dateAndTime toValue: (mailMessage fields at: 'squeak-date');
					setProperty: #mailAddress toValue: (mailMessage fields at: 'squeak-mail-address');
					setProperty: #authorInitials toValue: (mailMessage fields at: 'squeak-author-initials');
					setProperty: #authorKey toValue: (mailMessage fields at: 'squeak-author-key');
					setProperty: #authorFullName toValue: (mailMessage fields at: 'squeak-author-fullname');
					setMailMessage: mailMessage during: [:wrapper | wrapper messageId]; "Needed for conversations."
					yourself]].
	
	CachedMessages := wrappers sorted: #dateAndTime descending.
	
	"Remove duplicates. Those are some Mailman quirks."
	CachedMessages in: [:messages |
		| duplicates |
		duplicates := OrderedCollection new.
		messages overlappingPairsDo: [:a :b |
			(a dateAndTime = b dateAndTime "We just sorted those messages."
				and: [a messageId = b messageId]
				and: [a listName = b listName "Cross-list postings are no duplicates."])
					ifTrue: [duplicates add: b]].
		
		self flag: #todo. "mt: There are also duplicates with different timestamps in the same list. Mailman will log those messages repeatedly. However, it would take more time to detect those duplicates."
		
		CachedMessages removeAll: duplicates].