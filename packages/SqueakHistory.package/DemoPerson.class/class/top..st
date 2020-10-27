as yet unclassified
top: n

	^ (SqhMailmanAggregator newDefault authorKeysSorted
		take: n)
		collect: [:authorKey | self at: authorKey]