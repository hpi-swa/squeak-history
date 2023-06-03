preparation
downloadListNamed: listName
	
	^ self
		downloadListNamed: listName
		forTimespans: {(Year year: 1997) asDateAndTime to: DateAndTime now}