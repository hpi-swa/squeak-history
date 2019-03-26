normalization
lookupAuthorInitials: mailMessage
	"Needs #normalizeAuthor: first! Needs #normalizeMailAddress: first!"
	
	(mailMessage fields includesKey: 'squeak-author-key')
		ifFalse: [Error signal: 'Run author normalization first!'].
	(mailMessage fields includesKey: 'squeak-author-initials')
		ifFalse: [Error signal: 'Run mail-address normalization first!'].
			
	(mailMessage fields at: 'squeak-author-initials')
		addAll: (self authorInitials
				at: (mailMessage fields at: 'squeak-author-key')
				ifAbsent: [#()]).