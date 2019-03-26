preparation
downloadTweak

	| urlToPiper localPath urlsToMonth directory |
	urlToPiper := self urlOfTweak.

	localPath := self archivePath, FileDirectory slash, 'tweak'.
	(directory := FileDirectory on: localPath) assureExistence.
	
	urlsToMonth := ((WebClient httpGet: urlToPiper) content findTokens: '"')
		select: [:ea | ea endsWith: 'date.html'].
	urlsToMonth do: [:urlToMonth |
		| urlsToMessage |
		urlsToMessage := ((WebClient httpGet: urlToPiper, urlToMonth) content findTokens: '"')
			select: [:token | (token endsWith: '.html')
				and: [(token first: 6) "000000.html" allSatisfy: [:char | char isDigit]]]
			thenCollect: [:token | (urlToMonth findTokens: '/') first, '/', token].
			
		directory
			forceNewFileNamed: (urlToMonth findTokens: '/') first, '.txt'
			do: [:monthlyArchive |
		
				urlsToMessage do: [:urlToMessage |
					| htmlMessage mboxMessage |
					[(htmlMessage := (WebClient httpGet: urlToPiper, urlToMessage)) code = 504]
						whileTrue: [Transcript showln: 'RETRY ', htmlMessage code asString, ' ', urlToMessage].
					htmlMessage code = 200
						ifFalse: [Transcript showln: 'SKIPPED ', htmlMessage code asString, ' ', urlToMessage]
						ifTrue: [
							htmlMessage := htmlMessage content.
							
							mboxMessage := self convertHtmlToMBox: htmlMessage.
							
							monthlyArchive
								nextPutAll: mboxMessage;
								cr
				]] displayingProgress: [:urlToMessage | urlToMessage].]
		] displayingProgress: [:urlToMonth | 'Downloading ... ', urlToMonth].