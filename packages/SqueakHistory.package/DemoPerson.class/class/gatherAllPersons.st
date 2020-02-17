cache
gatherAllPersons
	
	"self forgetAllPersons."
	SqhMailmanAggregator messages do: [:wrapper |
		self from: wrapper assureProperties].
	^ self allPersons