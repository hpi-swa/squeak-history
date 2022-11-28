preparation
downloadMessagesIn: fileName from: urlToPiperFile into: directory

	| response content |
	response := WebClient httpGet: urlToPiperFile, fileName.
	content := response content.
	
	(fileName endsWith: '.gz') ifTrue: [
		content := content unzipped].
	self flag: #decoding. "content is a utf-8-encoded string (not squeak-encoded, as the server does not properly indicate the charset in the Content-Type header - see http://lists.squeakfoundation.org/pipermail/squeak-dev/2022-November/222730.html). For performance, write it to the file directly, i.e., skipping #utf8ToSqueak conversion and MultiByteFileStream. Note that decoding the stored files in the mbox reader seems to independent of the original file encoding (does it auto-detect the encoding?), but we produce appropriate files here that can also be parsed using other tools."
	
	StandardFileStream
		forceNewFileNamed:
			(directory fullNameFor:
				((fileName endsWith: '.gz')
					ifTrue: [fileName allButLast: 3]
					ifFalse: [fileName]))
		do: [:outputStream |
			outputStream nextPutAll: content].