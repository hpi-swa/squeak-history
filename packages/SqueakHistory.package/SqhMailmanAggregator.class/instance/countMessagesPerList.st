queries
countMessagesPerList
	" a Dictionary('beginners'->9830 'etoys-dev'->7791 'squeak-dev'->201471 'squeakland'->6858 'tweak'->992 'vm-beginners'->366 'vm-dev'->30473 )"

	| result |
	result := Dictionary new.
	self messagesCachedDo: [:wrapper |
		result
			at: wrapper listName
			put: (result at: wrapper listName ifAbsentPut: [0]) + 1].
	^ result