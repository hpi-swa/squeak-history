private
decode: aString

	self flag: #decoding. "Decoding was moved hither from mbox reader. See comment in SqhMBoxReadWriter>>#getMessageFrom:to:."
	^ [aString utf8ToSqueak] ifError: [aString "fallback for miss-encoded characters"]