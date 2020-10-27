queries
authorKeysSorted

	| authors |
	authors := Bag new.
	self messagesCachedDo: [:wrapper | 
		(self genericAuthorKeys includes: wrapper authorKey)
			ifFalse: [authors add: wrapper authorKey]].
	^ authors sortedCounts collect: [:assoc | assoc value]