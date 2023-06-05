preparation
downloadList: listName from: urlToPiper forMonthsThat: monthBlock to: localPath
	"The list name will be added as an extra directory to the local path."

	| directory fileNames |
	directory := FileDirectory on: localPath, FileDirectory slash, listName.
	directory assureExistence.
	
	fileNames := (self fetchFileNamesFrom: urlToPiper) collect: [:fileName | fileName -> (self monthFromFileName: fileName)].
	fileNames := fileNames select: [:fileNameAndMonth | monthBlock value: fileNameAndMonth value].
	fileNames := fileNames collect: [:fileNameAndMonth |
		(fileNameAndMonth key endsWith: '.txt.gz') ==> [self acceptsZipFileFor: fileNameAndMonth value]
			ifTrue: [fileNameAndMonth key]
			ifFalse: [fileNameAndMonth key sqhWithoutTrailing: '.gz']].
	
	fileNames
		do: [:fileName | self downloadMessagesIn: fileName from: urlToPiper into: directory]
		displayingProgress: [:fileName | 'Downloading {1} ... {2}' format: {directory localName. fileName}]