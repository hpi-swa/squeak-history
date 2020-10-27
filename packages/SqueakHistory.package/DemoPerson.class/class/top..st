as yet unclassified
top: n

	^ (SqhMailmanAggregator newDefault authorKeysSorted
		collect: [:authorKey | self at: authorKey]) take: n