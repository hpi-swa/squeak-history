preparation - private
pipermailAcceptsZipFileFor: aMonth
	"The pipermail server provides both a plaintext file of all messages and a gzipped version of that plaintext file. In some situations, however, the gzipped version is not refreshed in-time, so for very recent months, we prefer the plaintext file instead."

	^ DateAndTime now - aMonth next > 2 days