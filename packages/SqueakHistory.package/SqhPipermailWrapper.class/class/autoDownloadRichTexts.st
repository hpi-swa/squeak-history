preferences
autoDownloadRichTexts
	<preference: 'Automatically download formatted pipermail message texts' category: 'Squeak History' description: 'Pipermail provides formatted message texts (#richText) in separate files. Downloading them will increase memory consumption and slow down browsing, depending on the available internet connection. If formatted message texts are not downloaded automatically, you can still access the plaintext version of messages.' type: #Boolean>

	^ AutoDownloadRichTexts ifNil: [true]