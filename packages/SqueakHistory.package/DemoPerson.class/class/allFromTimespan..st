accessing instances and variables
allFromTimespan: timespan

	^ (SqhMailmanAggregator newDefault authorKeysSortedFromTimespan: timespan)
		collect: [:authorKey | self at: authorKey]