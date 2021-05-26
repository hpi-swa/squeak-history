accessing instances and variables
top: n

	^ (SqhMailmanAggregator newDefault authorKeysSorted
		take: n)
		collect: [:authorKey | self at: authorKey]