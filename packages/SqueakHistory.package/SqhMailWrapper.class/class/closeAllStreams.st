initialize-release
closeAllStreams
	"self closeAllStreams"

	ArchiveFileStreams ifNil: [^ self].
	ArchiveFileStreams reject: [:stream | stream closed] thenDo: [:stream | stream close].
	ArchiveFileStreams := nil