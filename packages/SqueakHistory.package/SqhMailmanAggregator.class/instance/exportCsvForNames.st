queries - export
exportCsvForNames

	FileStream forceNewFileNamed: 'names.csv' do: [:stream |
		stream
			nextPutAll: 'key'; nextPut: $;;
			nextPutAll: 'name'; nextPut: $;;
			nextPutAll: 'count'; nextPut: $;;
			nextPutAll: 'mails';
			cr.
	
	self aggregateAuthors keysAndValuesDo: [:authorKey :content |
	
		stream
			nextPutAll: authorKey; nextPut: $;;
			nextPutAll: ((content at: #name) someElement copyReplaceAll: ';' with: ',') ; nextPut: $;;
			nextPutAll: (content at: #count) asString; nextPut: $;.
		(content at: #mail)
			do: [:ea | stream nextPutAll: ea]
			separatedBy: [stream nextPut: $;].
		stream cr.
		]]