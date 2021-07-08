private
decode: aString
	"Apply zero up to two decodings until an error occurs. Worked well for Squeak Inbox Talk."

	| decoded |
	decoded := aString.
	^ [(decoded := decoded utf8ToSqueak) utf8ToSqueak] ifError: [decoded]