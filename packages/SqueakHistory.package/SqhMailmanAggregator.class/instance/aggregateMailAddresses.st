queries
aggregateMailAddresses
	"Can be used to identify more duplicate author-keys."
	
	| result |
	result := Dictionary new.
	self messagesCachedDo: [:wrapper |
		wrapper mailAddress in: [:mailAddress |
			(self genericMailAddresses includes: mailAddress) ifFalse: [
				(result
					at: mailAddress
					ifAbsentPut: [Set new])
						add: wrapper authorKey]]].
	^ result