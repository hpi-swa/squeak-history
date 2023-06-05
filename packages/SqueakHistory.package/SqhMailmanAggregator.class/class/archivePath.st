defaults
archivePath

	^ ArchivePath ifNil: [
		(Project uiManager
			perform: ((Project uiManager respondsTo: #chooseOptionFromLabeledValues:title:) ifTrue: [">= Squeak 6.0" #chooseOptionFromLabeledValues:title:] ifFalse: [#chooseFromLabeledValues:title:])
			with: (OrderedDictionary new
				at: 'OK, use default path' put: [ArchivePath := self archivePathDefault];
				at: 'No, change to custom path' put: [(UIManager default
					chooseDirectory: 'Squeak History - Choose Data Directory'
					from: FileDirectory default)
					ifNil: [self archivePathDefault]
					ifNotNil: [:directory | ArchivePath := directory fullName]];
				yourself)
			with: ('There is no archive path set to store data.\The following default will be used:\\{1}\\Is this okay for you?' withCRs format: {self archivePathDefault})) value]