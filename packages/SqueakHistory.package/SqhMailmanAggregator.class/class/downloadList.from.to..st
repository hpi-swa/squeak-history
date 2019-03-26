preparation
downloadList: listName from: urlToPiper to: localPath
	"The list name will be added as an extra directory to the local path."

	| directory fileNames |
	directory := FileDirectory on: localPath, FileDirectory slash, listName.
	directory assureExistence.
	
	fileNames := ((WebClient httpGet: urlToPiper) content findTokens: '"')
		select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']].

	fileNames
		do: [:fileName | | response stream |
			response := WebClient httpGet: urlToPiper, fileName.
			stream := #[] writeStream.
			response
				streamTo: stream
				size: response contentLength
				progress: nil.
			(fileName endsWith: '.gz')
				ifTrue: [directory forceNewFileNamed: (fileName allButLast: 3) do: [:outputStream |
					outputStream nextPutAll: stream contents unzipped]]
				ifFalse: [directory forceNewFileNamed: fileName do: [:outputStream |
					outputStream nextPutAll: stream contents]]]
		displayingProgress: [:fileName | 'Downloading ', directory localName, ' ... ', fileName].