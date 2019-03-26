instance creation
newDefault

	^ self new
		mailingLists: self allListNames;
		yourself