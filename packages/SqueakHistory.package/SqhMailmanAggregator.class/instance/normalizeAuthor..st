normalization
normalizeAuthor: mailMessage

	| rawAuthor authorKey authorFullName |
	rawAuthor := mailMessage from. "mt: Is there reply-to in mbox?"
	
	"Example: 'boris at dialogue.msu.su (Boris G. Chr. Shingarov)' "
	rawAuthor := rawAuthor copyFrom: (rawAuthor findString: '(') + 1 to: rawAuthor size - 1.
	"Example:  'sqrmax@cvtci.com.ar' "
	rawAuthor := (rawAuthor findTokens: '@') ifEmpty: ['unknown author'] ifNotEmpty: [:t | t first].
	"Example: 'von Löwis, Martin' "
	rawAuthor := ((rawAuthor findTokens: ',') reversed joinSeparatedBy: ' ') withBlanksTrimmed.
	
	authorFullName := (rawAuthor copyWithoutAll: '()"'';') withBlanksTrimmed.
	authorKey := self normalizedAuthorKeyFromName: authorFullName.	
	
	"X1) Consider the rules for author-key clarification."
	self rulesForAuthorKeyClarification
		at: (mailMessage fields at: 'squeak-mail-address')
		ifPresent: [:mapping | 
			((mapping key isArray and: [mapping key anySatisfy: [:ea | authorKey = ea]])
				or: [authorKey = mapping key]) ifTrue: [authorKey := mapping value]].
				
	"X2) If empty, try mail address."
	authorKey ifEmpty: [
		authorKey := ((mailMessage fields at: 'squeak-mail-address') findTokens: '@') first.
		"... and repeat the steps above ..."
		authorKey := self normalizedAuthorKeyFromName: authorKey.
		self rulesForAuthorKeyClarification
			at: (mailMessage fields at: 'squeak-mail-address')
			ifPresent: [:mapping | authorKey = mapping key ifTrue: [authorKey := mapping value]]].
	
	mailMessage fields
		at: 'squeak-author-key' put: authorKey;
		at: 'squeak-author-fullname' put: authorFullName.