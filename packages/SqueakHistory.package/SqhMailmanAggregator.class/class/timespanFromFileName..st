support
timespanFromFileName: fileName

	^ true caseOf:
		{[(fileName endsWith: '.txt') or: [fileName endsWith: '.txt.gz']] ->
			"pipermail"
			[| dateString |
			dateString := fileName.
			dateString := dateString sqhWithoutTrailing: '.gz'.
			dateString := dateString sqhWithoutTrailing: '.txt'.
			dateString := dateString, '-01'.
			(Date fromString: dateString) asMonth].
		[fileName endsWith: '.mbox'] ->
			"HyperKitty"
			[| startString endString |
			endString := (fileName allButLast: '.mbox' size) last: 10.
			self assert: (fileName atLast: '.mbox' size + 11) = $_.
			startString := (fileName allButLast: '.mbox' size + 11) last: 10.
			self assert: (fileName atLast: '.mbox' size + 22) = $_.
			(Date fromString: startString) to: (Date fromString: endString)]}