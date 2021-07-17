support
monthFromFileName: fileName

	| dateString |
	dateString := fileName.
	dateString := dateString sqhWithoutTrailing: '.gz'.
	dateString := dateString sqhWithoutTrailing: '.txt'.
	dateString := dateString, '-01'.
	^ (Date fromString: dateString) asMonth