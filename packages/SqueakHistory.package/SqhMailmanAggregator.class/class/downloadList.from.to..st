preparation
downloadList: listName from: urlToPiper to: localPath
	"The list name will be added as an extra directory to the local path."

	| directory fileNames |
	directory := FileDirectory on: localPath, FileDirectory slash, listName.
	directory assureExistence.
	
	fileNames := ((WebClient httpGet: urlToPiper) content findTokens: '"')
		select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']]
		thenCollect: [:fileName | fileName -> (self monthFromFileName: fileName)].
	fileNames := fileNames collect: [:fileNameAndMonth |
		(fileNameAndMonth key endsWith: '.txt.gz') ==> [self acceptsZipFileFor: fileNameAndMonth value]
			ifTrue: [fileNameAndMonth key]
			ifFalse: [fileNameAndMonth key sqhWithoutTrailing: '.gz']].
	
	fileNames
		do: [:fileName | self downloadMessagesIn: fileName from: urlToPiper into: directory]
		displayingProgress: [:fileName | 'Downloading {1} ... {2}' format: {directory localName. fileName}]