enumerating - raw
fileEntriesForList: listName

	| directory entries |
	directory := FileDirectory on: self class archivePath, FileDirectory slash, listName.
	directory assureExistence.
	entries := directory fileEntries.
	
	self dateFilter ifNotNil: [:filter |
		entries := entries select: [:entry | filter value:
			(self class timespanFromFileName: entry name)]].
	
	^ entries