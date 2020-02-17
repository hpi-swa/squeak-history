as yet unclassified
senders

	^ DemoPerson allPersons
		ifEmpty: [DemoPerson gatherAllPersons]