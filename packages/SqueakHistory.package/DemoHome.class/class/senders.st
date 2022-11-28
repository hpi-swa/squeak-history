accessing
senders

	^ DemoPerson allPersons
		ifEmpty: [DemoPerson gatherAllPersons]