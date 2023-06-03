enumerating - raw
messagesDo: workBlock

	^ self
		with: self mailingLists
		do: [:listName |
			self
				with: (self fileEntriesForList: listName)
				do: [:fileEntry |
					| mailType |
					mailType := self class mailTypeFromFileName: fileEntry name.
					SqhMBoxReadWriter onFileNamed: fileEntry fullName do: [:reader |
						[reader atEnd] whileFalse: [
							reader nextMessage in: [:mailMessage |
								(self dateFilter
									ifNil: [true]
									ifNotNil: [:filter | filter value: mailMessage sqhDate])
										ifTrue:
											[self logOnTranscript ifTrue: [Transcript showln: mailMessage subject].
											mailMessage fields at: 'squeak-file-name' put: reader fileName.
											mailMessage fields at: 'squeak-mail-type' put: mailType.
											workBlock cull: mailMessage cull: listName]]]]]
				displayingProgress: 'Processing messages...']
		displayingProgress: [:listName | 'Processing {1}...' format: {listName}]