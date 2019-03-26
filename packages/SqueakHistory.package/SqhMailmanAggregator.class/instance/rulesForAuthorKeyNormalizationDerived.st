normalization - support
rulesForAuthorKeyNormalizationDerived
	"Prepare this index with a manual call to #deriveRulesForAuthorKeyNormalization."
	
	^ RulesForAuthorKeyNormalizationDerived ifNil: [Dictionary new]