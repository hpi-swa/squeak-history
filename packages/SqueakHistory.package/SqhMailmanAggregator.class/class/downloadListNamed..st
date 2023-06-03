preparation
downloadListNamed: listName
	
	^ self
		downloadListNamed: listName
		forTimespans: {DateAndTime new "zero" to: DateAndTime now}