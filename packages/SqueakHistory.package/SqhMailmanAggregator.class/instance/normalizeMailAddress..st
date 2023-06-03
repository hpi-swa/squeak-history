normalization
normalizeMailAddress: mailMessage
	"... and prepare author initials."

	| address initials |
	mailMessage fields at: 'squeak-mail-address' ifPresent: [.
		mailMessage fields at: 'squeak-author-initials' ifPresent: [^ self]].
	
	address := mailMessage from. "mt: Is there reply-to in mbox?"
	initials := Set new.
	
	"Example: 'boris at dialogue.msu.su (Boris G. Chr. Shingarov)' "
	address := address copyFrom: 1 to: (address findString: '(') - 1.
	address := address copyReplaceAll: ' at ' with: '@'.
	"... ""sv04er502""@sneakemail.com ..."
	"... '''squeak mailinglist'' <squeak@cs.uiuc.edu'  ... "
	self flag: #performance.
	address := address copyWithoutAll: '"'' <'.
	
	address := address withBlanksTrimmed.
	
	(address includesSubstring: '@')
		ifTrue: [address := address asLowercase]
		ifFalse: [
			"Treat address as author initials. Were those mails be sent from within an etoys image?"
			initials add: address.
			address := 'error@doesnotexist.foo'].
	
	mailMessage fields at: 'squeak-mail-address' put: address.
	mailMessage fields at: 'squeak-author-initials' put: initials.