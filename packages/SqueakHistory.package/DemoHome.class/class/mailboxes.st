as yet unclassified
mailboxes

	^ SqhMailmanAggregator allListNames
		collect: [:ea | DemoMailbox named: ea]