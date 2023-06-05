private
decode: aString
	"Pipermail brings its own encoding troubles ..."

	| string |
	string := super decode: aString.
	^ [string utf8ToSqueak] ifError: [string "fallback for miss-encoded characters"]