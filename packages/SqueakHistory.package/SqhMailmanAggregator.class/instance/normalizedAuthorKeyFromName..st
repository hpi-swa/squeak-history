normalization - support
normalizedAuthorKeyFromName: authorFullName

	| authorKey |
	authorKey := authorFullName.
	
	"1) Only regular, lowercase letters."
	authorKey := authorKey select: [:char | char isLetter and: [char asInteger < 256]].
	authorKey := authorKey asLowercase.
	
	"2) No accents etc."
	self rulesForLetterNormalization do: [:rule |
		authorKey := authorKey copyReplaceAll: rule key with: rule value].
	
	"3) Hand-crafted author de-duplication."
	self rulesForAuthorKeyNormalization
		at: authorKey
		ifPresent: [:mapping | authorKey := mapping].
	
	"4) Derived author de-duplication."
	self rulesForAuthorKeyNormalizationDerived
		at: authorKey
		ifPresent: [:mapping | authorKey := mapping].	
	
	^ authorKey