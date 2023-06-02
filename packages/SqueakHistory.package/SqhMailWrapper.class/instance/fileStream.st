accessing - raw
fileStream

	ArchiveFileStreams ifNil: [ArchiveFileStreams := Dictionary new].
	
	^ ArchiveFileStreams
		at: self fileName
		ifPresent: [:stream | stream closed ifFalse: [stream] ifTrue: [
			"Replace old stream with fresh one."
			ArchiveFileStreams
				at: self fileName
				put: self newFileStream]] 
		ifAbsentPut: [
			"Install a new stream."
			self newFileStream].