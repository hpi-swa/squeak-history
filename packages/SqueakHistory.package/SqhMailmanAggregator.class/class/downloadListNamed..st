preparation
downloadListNamed: listName
	
	self
		downloadListFrom: (self allLists detect: [:spec | spec value = listName])
		to: self archivePath.