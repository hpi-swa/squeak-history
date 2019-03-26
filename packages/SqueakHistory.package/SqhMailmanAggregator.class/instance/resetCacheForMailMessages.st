preparation - message cache
resetCacheForMailMessages
	"Create instances of MailmanMailMessage to function as wrappers around MailMessage for quick access."
	
	CachedMessages := OrderedCollection new: 200000.
	
	self messagesNormalizedDo: [:mailMessage :listName |
		CachedMessages add: (
			(SqhMailWrapper from: mailMessage)
				setProperty: #listName toValue: listName;
				setProperty: #dateAndTime toValue: (mailMessage fields at: 'squeak-date');
				setProperty: #mailAddress toValue: (mailMessage fields at: 'squeak-mail-address');
				setProperty: #authorInitials toValue: (mailMessage fields at: 'squeak-author-initials');
				setProperty: #authorKey toValue: (mailMessage fields at: 'squeak-author-key');
				setProperty: #authorFullName toValue: (mailMessage fields at: 'squeak-author-fullname');
				yourself)].