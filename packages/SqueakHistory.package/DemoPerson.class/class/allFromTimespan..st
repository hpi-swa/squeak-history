as yet unclassified
allFromTimespan: timespan

	^ (SqhMailmanAggregator newDefault authorKeysSortedFromTimespan: timespan)
		collect: [:authorKey | self at: authorKey]