preparation
downloadAllLists
	"self downloadAllLists."
	
	(self allLists reject: [:spec | spec value = 'tweak'])
		do: [:spec |
			self
				downloadListFrom: spec
				to: self archivePath]
		displayingProgress: [:url | url].