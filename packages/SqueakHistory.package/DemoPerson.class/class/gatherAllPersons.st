cache
gatherAllPersons
	"
	self forgetAllPersons.
	self gatherAllPersons.
	"
	| aggregator |
	aggregator := SqhMailmanAggregator newDefault.
	
	aggregator messagesCachedDo: [:wrapper |
		self from: wrapper assureProperties].
	
	self allPersons do: [:person |
		person mailAddresses sort: [:a :b | a value > b value].
		aggregator rulesForAuthorFullNameClarification
			at: person authorKey
			ifPresent: [:preferredName | person setPreferredName: preferredName]].
	
	^ self allPersons