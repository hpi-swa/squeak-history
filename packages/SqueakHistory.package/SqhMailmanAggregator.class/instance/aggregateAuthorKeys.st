queries
aggregateAuthorKeys
	"Can be used to identify more duplicate author-keys."
	
	| result |
	result := Dictionary new.
	self messagesCachedDo: [:wrapper |
		wrapper mailAddress in: [:mailAddress |
			(self genericMailAddresses includes: mailAddress) ifFalse: [
				(result
					at: wrapper authorKey
					ifAbsentPut: [Set new])
						add: mailAddress]]].
	^ result