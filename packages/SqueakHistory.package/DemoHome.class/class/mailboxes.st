accessing
mailboxes

	^ SqhMailmanAggregator allListNames
		collect: [:ea | DemoMailbox named: ea]