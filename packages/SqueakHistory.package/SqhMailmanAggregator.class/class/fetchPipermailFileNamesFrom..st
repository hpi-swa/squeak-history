preparation
fetchPipermailFileNamesFrom: urlToPiper

	| response |
	response := WebClient httpGet: urlToPiper.
	response isSuccess ifFalse: [self error: response status].
	^ (response content findTokens: '"')
		select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']]