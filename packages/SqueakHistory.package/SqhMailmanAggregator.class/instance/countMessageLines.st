queries
countMessageLines

	| count |
	count := 0.
	self messagesCachedDo: [:wrapper |
		count := count + wrapper mailMessage bodyText lineCount].
	^ count