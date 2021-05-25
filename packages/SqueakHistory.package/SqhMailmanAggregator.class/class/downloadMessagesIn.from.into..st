preparation
downloadMessagesIn: fileName from: urlToPiperFile into: directory

	| response stream |
	response := WebClient httpGet: urlToPiperFile, fileName.
	stream := '' writeStream.
	response streamTo: stream size: response contentLength progress: nil.
	(fileName endsWith: '.gz')
		ifTrue: [
			directory
				forceNewFileNamed: (fileName allButLast: 3)
				do: [:outputStream | outputStream nextPutAll: stream contents unzipped]]
		ifFalse: [
			directory
				forceNewFileNamed: fileName
				do: [:outputStream | outputStream nextPutAll: stream contents]]