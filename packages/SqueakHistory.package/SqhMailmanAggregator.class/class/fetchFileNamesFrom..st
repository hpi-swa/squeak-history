preparation
fetchFileNamesFrom: urlToPiper

	^ ((WebClient httpGet: urlToPiper) content findTokens: '"')
		select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']]