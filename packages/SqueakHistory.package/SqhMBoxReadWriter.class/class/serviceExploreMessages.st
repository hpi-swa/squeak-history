file services
serviceExploreMessages

	^ SimpleServiceEntry
		provider: self
		label: 'explore mailman messages'
		selector: #exploreFileNamed:
		description: 'Open the collection of mailman messages in an explorer. Limited support for mbox files from other sources.'
		buttonLabel: 'explore mailman messages'