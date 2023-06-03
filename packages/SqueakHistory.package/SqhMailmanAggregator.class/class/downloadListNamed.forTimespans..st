preparation
downloadListNamed: listName forTimespans: timespans

	^ self
		downloadList: listName
		from: (self allLists at: listName)
		forTimespans: timespans
		to: self archivePath