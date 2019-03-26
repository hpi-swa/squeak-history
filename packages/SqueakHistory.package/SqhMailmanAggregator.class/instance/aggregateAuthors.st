queries
aggregateAuthors

	| result |
	result := Dictionary new.
	self messagesCachedDo: [:wrapper |
		| entry |
		entry := result
			at: wrapper authorKey
			ifAbsentPut: [Dictionary new].

		(entry at: #name ifAbsentPut: [Set new])
			add: wrapper authorFullName.
		(entry at: #mail ifAbsentPut: [Set new])
			add: wrapper mailAddress.
		(entry at: #initials ifAbsentPut: [Set new])
			addAll: wrapper authorInitials.
			
		"Count the message."
		entry at: #count put: (entry at: #count ifAbsent: [0]) + 1].
	
	^ result