enumerating - raw
messagesDo: workBlock

	| directory reader |
	self with: self mailingLists do: [:listName |
		directory := FileDirectory on: self class archivePath, FileDirectory slash, listName.
		directory assureExistence. "Necessary?"
		directory fileEntries do: [:fileEntry |
			reader := SqhMBoxReadWriter onFileNamed: fileEntry fullName.
			[reader atEnd] whileFalse: [
				reader nextMessage in: [:mailMessage |
					self logOnTranscript ifTrue: [Transcript showln: mailMessage subject].
					mailMessage fields at: 'squeak-file-name' put: reader fileName.
					workBlock cull: mailMessage cull: listName]]]].