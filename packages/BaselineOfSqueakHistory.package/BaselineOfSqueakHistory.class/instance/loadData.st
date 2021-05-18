scripts
loadData

	self isCI ifTrue: [^ self].
	
	#(
		(10 'Setting archive path')
		(20 'Downloading mailman archives')
		(30 'Downloading Tweak from web.archive.org')
		(40 'Preparing mail normalization')
		(50 'Filling mail access cache')
		(99 'Run example query')
	) do: [:spec | spec first caseOf: {
		[10] -> [SqhMailmanAggregator archivePath].
		[20] -> [SqhMailmanAggregator downloadAllLists].
		[30] -> [(UIManager default
			confirm: 'Do you want to try downloading the Tweak list\archives from web.archive.org?\\If this fails, try looking for the data at\github.com/hpi-swa/squeak-history.' withCRs
			title: 'Squeak History - Preparation')
				ifTrue: [SqhMailmanAggregator downloadTweak]].
		[40] -> [SqhMailmanAggregator newDefault
			showProgress: true;
			deriveRulesForAuthorKeyNormalization].
		[50] -> [SqhMailmanAggregator newDefault
			showProgress: true;
			resetCacheForMailMessages].
		[99] -> [(UIManager default
			confirm: 'Preparation finished.\\Do you want to count the number of\messages as an example query?' withCRs
			title: 'Squeak History - Example')
				ifTrue: [SqhMailmanAggregator newDefault countMessagesPerList explore]].
	}] displayingProgress: [:spec | spec second, '...'].