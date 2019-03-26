preparation
downloadListFrom: urlToPiper to: localPath

	self
		downloadList: (urlToPiper findTokens: '/') last
		from: urlToPiper
		to: localPath.