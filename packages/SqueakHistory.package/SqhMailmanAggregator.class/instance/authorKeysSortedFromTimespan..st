queries
authorKeysSortedFromTimespan: timespan

	| authors |
	authors := Bag new.
	self messagesCachedDo: [:wrapper | 
		(self genericAuthorKeys includes: wrapper authorKey)
			ifFalse: [(timespan includes: wrapper dateAndTime)
				ifTrue: [authors add: wrapper authorKey]]].
	^ authors sortedCounts collect: [:assoc | assoc value]