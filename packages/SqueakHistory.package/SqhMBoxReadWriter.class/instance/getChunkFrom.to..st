reading - index
getChunkFrom: start to: end
	"Returns the content for the a mail message given the specific location in the stream."

	| result separator |
	result := OrderedCollection new.
	stream position: start.
	separator := self nextLine.

	^ 'separator: {1}\{2}' withCRs format: {
			separator.
			stream next: end - stream position}