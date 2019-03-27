normalization - support
deriveRulesForAuthorKeyNormalization

	| firstLevel secondLevel thirdLevel fourthLevel result |
	RulesForAuthorKeyNormalizationDerived := Dictionary new.
	firstLevel := self aggregateMailAddressesUncached.

	"1) Discard one-item lists."
	secondLevel := OrderedCollection new: 500.
	firstLevel keysAndValuesDo: [:mailAddress :authorKeys |
		authorKeys size > 1 ifTrue: [secondLevel add: authorKeys]].
	
	"2) Merge remaining items."
	thirdLevel := self derivedRulesForAuthorKeyNormalizationFrom: secondLevel.

	"3) Choose the longest one or the one that you find in the list of author initials."
	self authorInitials in: [:ai |
		fourthLevel := Dictionary new.
		thirdLevel do: [:authorKeys |
			authorKeys
				detect: [:key | ai includesKey: key]
				ifFound: [:knownKey |
					fourthLevel at: knownKey put: (authorKeys copyWithout: knownKey)]
				ifNone: [
					| longestKey |
					longestKey := ''.
					authorKeys do: [:ea | ea size > longestKey size ifTrue: [longestKey := ea]].
					fourthLevel at: longestKey put: (authorKeys copyWithout: longestKey)]]].

	"4) Construct result."
	result := Dictionary new.
	fourthLevel keysAndValuesDo: [:targetKey :sourceKeys |
		sourceKeys do: [:sourceKey | result at: sourceKey put: targetKey]].

	"5) Double-check whether mapping cycles are introduced."
	self rulesForAuthorKeyNormalization keysAndValuesDo: [:outerSource :outerTarget |
		result keysAndValuesDo: [:innerSource :innerTarget |
			outerTarget = innerSource ifTrue: [Error signal: 'Mapping cycle detected!']]].
	self rulesForAuthorKeyClarification keysAndValuesDo: [:sourceMail :mapping |
		result keysAndValuesDo: [:innerSource :innerTarget |
			mapping value = innerSource ifTrue: [Error signal: 'Mapping cycle detected!']]].

	"6) Store the result."
	RulesForAuthorKeyNormalizationDerived := result.