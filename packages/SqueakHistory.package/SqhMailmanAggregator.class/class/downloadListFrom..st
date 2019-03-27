preparation
downloadListFrom: urlToPiper
	
	self
		downloadListFrom: urlToPiper -> (urlToPiper findTokens: '/') last
		to: self archivePath.