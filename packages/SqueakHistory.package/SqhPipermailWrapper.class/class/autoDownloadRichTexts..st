preferences
autoDownloadRichTexts: aBoolean

	| old |
	old := self autoDownloadRichTexts.
	AutoDownloadRichTexts := aBoolean.
	
	(old not and: [aBoolean]) ifTrue: [
		"discard existing plaintext values"
		self allSubInstancesDo: [:ea | ea removeProperty: #richText]].