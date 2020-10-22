normalization - support
derivedRulesForAuthorKeyNormalizationFrom: someKeyTuples
	"Given a list of tuples, merge those tuples, then define the target key. Can be useful after generating such tuples from a bunch of mail addresses. See #aggregateMailAddresses(Uncached)."
	
	| result prev |

	[prev isNil or: [prev size ~= result size]] whileTrue: [
		prev := result.
		result := OrderedCollection new: 500.
		someKeyTuples do: [:tuple |
			result
				detect: [:ea | ea includesAnyOf: tuple]
				ifFound: [:ea |
					"Merge!"
					ea addAll: tuple]
				ifNone: [result add: tuple asSet]]].
	^ result