defaults
archivePath

	<preference: 'Local Archive Path'
		category: 'Squeak History'
		description: 'Where to store downloads?'
		type: #String>
		
	^ ArchivePath ifNil: [
		(UIManager default
			confirm: ('There is no archive path set to store data.\The following default will be used:\\{1}\\Do you want to change that to a custom path now?' withCRs format: {self archivePathDefault})
			title: 'Squeak History')
				ifFalse: [ArchivePath := self archivePathDefault]
				ifTrue: [
					(UIManager default
						chooseDirectory: 'Squeak History - Choose Data Directory'
						from: FileDirectory default)
							ifNil: [self archivePathDefault]
							ifNotNil: [:directory | ArchivePath := directory fullName]]]