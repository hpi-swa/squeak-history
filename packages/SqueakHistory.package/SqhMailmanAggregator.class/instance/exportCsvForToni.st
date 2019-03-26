queries - export
exportCsvForToni

	| i |
	i := 0.
	FileStream forceNewFileNamed: 'toni.csv' do: [:stream |
		stream
			nextPutAll: '#'; nextPut: $;;
			nextPutAll: 'list'; nextPut: $;;
			nextPutAll: 'author-key'; nextPut: $;;
			nextPutAll: 'timestamp'; nextPut: $;;
			nextPutAll: 'author-fullname'; nextPut: $;;
			nextPutAll: 'subject'; nextPut: $;;
			nextPutAll: 'body'; nextPut: $;;
		
			cr.
		
		self messagesNormalizedDo: [:msg :list | 
			i := i + 1.
			
			stream
				nextPutAll: i asString; nextPut: $;;
				nextPutAll: list; nextPut: $;;
				nextPutAll: (msg fields at: 'squeak-author-key'); nextPut: $;;
				nextPutAll: (msg fields at: 'squeak-date') printString; nextPut: $;;
				nextPutAll: (msg fields at: 'squeak-author-fullname'); nextPut: $;;
				nextPutAll: (msg subject copyReplaceAll: ';' with: ''); nextPut: $;;
				nextPutAll: (((msg bodyText
								copyReplaceAll: String cr with: '<br>')
								copyReplaceAll: String lf with: '')
								copyReplaceAll: ';' with: ','); nextPut: $;;
				
				cr]].
		 