preparation
downloadListNamed: listName forMonthsThat: monthBlock

	^ self
		downloadListFrom: (self allLists detect: [:spec | spec value = listName])
		forMonthsThat: monthBlock
		to: self archivePath