as yet unclassified
top: n fromTimespan: timespan

	^ ((SqhMailmanAggregator newDefault authorKeysSortedFromTimespan: timespan)
		take: n)
		collect: [:authorKey | self at: authorKey]