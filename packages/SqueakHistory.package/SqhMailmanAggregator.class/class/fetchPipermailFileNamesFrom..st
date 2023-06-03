preparation
fetchPipermailFileNamesFrom: urlToPiper

	| content |
	content := self httpGet: urlToPiper.
	^ (content findTokens: '"')
		select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']]