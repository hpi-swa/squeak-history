as yet unclassified
fileStream

	ArchiveFileStreams ifNil: [ArchiveFileStreams := Dictionary new].
	
	^ ArchiveFileStreams
		at: self fileName
		ifPresent: [:stream | stream closed ifFalse: [stream] ifTrue: [
			"Replace old stream with fresh one."
			ArchiveFileStreams
				at: self fileName
				put: (StandardFileStream readOnlyFileNamed: fileName)]] 
		ifAbsentPut: [
			"Install a new stream."
			StandardFileStream readOnlyFileNamed: fileName].