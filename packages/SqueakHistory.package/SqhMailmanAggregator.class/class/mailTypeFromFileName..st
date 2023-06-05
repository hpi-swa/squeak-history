support
mailTypeFromFileName: fileName

	^ true
		caseOf:
			{[fileName endsWith: '.txt'] ->
				[SqhPipermailWrapper].
			[(fileName beginsWith: 'hyperkitty') and: [fileName endsWith: '.mbox']] ->
				[SqhHyperkittyMailWrapper]}
		otherwise:
			[SqhMailWrapper]