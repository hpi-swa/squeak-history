defaults
archivePath
	<preference: 'Local Archive Path' category: 'Squeak History' description: 'Where to store downloads?' type: #String>

	^ ArchivePath ifNil: [
		(UIManager default
			chooseFromLabeledValues: (OrderedDictionary new
				at: 'OK, use default path' put: [ArchivePath := self archivePathDefault];
				at: 'No, change to custom path' put: [(UIManager default
					chooseDirectory: 'Squeak History - Choose Data Directory'
					from: FileDirectory default)
					ifNil: [self archivePathDefault]
					ifNotNil: [:directory | ArchivePath := directory fullName]];
				yourself)
			title: ('There is no archive path set to store data.\The following default will be used:\\{1}\\Is this okay for you?' withCRs format: {self archivePathDefault})) value]