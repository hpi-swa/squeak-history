accessing - domain
plainText
	"Answer the plain text of the mail. May be a string or text."

	^ self valueOfProperty: #plainText ifAbsentPut: [
		([self basicPlainText] on: Error do: [:ex |
			"For HTML-only messages (or older versions of #bodyTextFormatted), we might still invoke a parser here that could possibly break."
			Transcript showln: ('Error while reading {1}: {2}' format: {self. ex}).
			'Error while parsing formatted message text, below is the raw text:\\' withCRs , self rawText])
				withBlanksTrimmed]