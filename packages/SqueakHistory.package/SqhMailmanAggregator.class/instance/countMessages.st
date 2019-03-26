queries
countMessages

	| count |
	count := 0.
	self messagesCachedDo: [:wrapper |
		count := count + 1].
	^ count