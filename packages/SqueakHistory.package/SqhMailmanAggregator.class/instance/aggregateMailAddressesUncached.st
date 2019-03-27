queries
aggregateMailAddressesUncached
	"Can be used to identify more duplicate author-keys."
	
	| result |
	result := Dictionary new.
	self messagesNormalizedDo: [:mailMessage |
		(mailMessage fields at: 'squeak-mail-address') in: [:mailAddress |
			(self genericMailAddresses includes: mailAddress) ifFalse: [
				(result
					at: mailAddress
					ifAbsentPut: [Set new])
						add: (mailMessage fields at: 'squeak-author-key')]]].
	^ result