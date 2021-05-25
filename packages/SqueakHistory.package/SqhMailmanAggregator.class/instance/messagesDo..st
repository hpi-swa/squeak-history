enumerating - raw
messagesDo: workBlock

	self with: self mailingLists do: [:listName |
		self with: (self fileEntriesForList: listName) do: [:fileEntry |
			SqhMBoxReadWriter onFileNamed: fileEntry fullName do: [:reader |
				[reader atEnd] whileFalse: [
					reader nextMessage in: [:mailMessage |
						self logOnTranscript ifTrue: [Transcript showln: mailMessage subject].
						mailMessage fields at: 'squeak-file-name' put: reader fileName.
						workBlock cull: mailMessage cull: listName]]]]]