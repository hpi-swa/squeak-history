preparation
downloadList: listName fromPipermail: pipermailSpec forTimespans: timespans into: directory

	| listUrl fileNames |
	listUrl := pipermailSpec isString
		ifTrue: [pipermailSpec , listName , '/']
		ifFalse: [pipermailSpec first , '/' , pipermailSpec second , '/'].
	
	fileNames := (self fetchPipermailFileNamesFrom: listUrl) collect: [:fileName | fileName -> (self timespanFromFileName: fileName)].
	fileNames := fileNames select: [:fileNameAndTimespan |
		timespans anySatisfy: [:requestedTimespan |
			(requestedTimespan intersection: fileNameAndTimespan value) notNil]].
	fileNames := fileNames collect: [:fileNameAndTimespan |
		(fileNameAndTimespan key endsWith: '.txt.gz') ==> [self pipermailAcceptsZipFileFor: fileNameAndTimespan value]
			ifTrue: [fileNameAndTimespan key]
			ifFalse: [fileNameAndTimespan key sqhWithoutTrailing: '.gz']].
	
	fileNames
		do: [:fileName | self downloadMessagesIn: fileName from: listUrl , fileName into: directory]
		displayingProgress: [:fileName | 'Downloading {1} ... {2}' format: {directory localName. fileName}]