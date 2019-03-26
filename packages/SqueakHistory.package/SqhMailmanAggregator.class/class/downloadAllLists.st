preparation
downloadAllLists
	"self downloadAllLists."
	
	self urlsOfLists
		do: [:url |
			self
				downloadListFrom: url
				to: self archivePath]
		displayingProgress: [:url | url].