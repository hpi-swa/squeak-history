preparation
downloadAllLists
	"self downloadAllLists."
	
	(self allListNames copyWithout: 'tweak')
		do: [:listName | self downloadListNamed: listName]
		displayingProgress: [:listName | listName].