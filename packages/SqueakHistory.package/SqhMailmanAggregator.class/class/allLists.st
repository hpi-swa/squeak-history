defaults
allLists
	"Note that Tweak has to be fetched manually through web.archive.org. See #downloadTweak."

	^ {
		'http://lists.squeakfoundation.org/pipermail/squeak-dev/' -> 'squeak-dev'.
		'http://lists.squeakfoundation.org/pipermail/beginners/' -> 'beginners'.
		'http://lists.squeakfoundation.org/pipermail/vm-dev/' -> 'vm-dev'.
		'http://lists.squeakfoundation.org/pipermail/vm-beginners/' -> 'vm-beginners'.
		'http://lists.squeakfoundation.org/pipermail/etoys-dev/' -> 'etoys-dev'.
		'http://lists.squeakfoundation.org/pipermail/squeakland/' -> 'squeakland'.
		'http://cuis-smalltalk.org/pipermail/cuis-dev_cuis-smalltalk.org/' -> 'cuis-dev'
	}, {self urlOfTweak -> 'tweak'}