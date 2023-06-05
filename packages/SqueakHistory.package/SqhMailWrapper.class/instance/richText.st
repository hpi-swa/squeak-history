accessing - domain
richText
	"Answer the rich text of the mail. May be a string or text."

	^ self valueOfProperty: #richText ifAbsentPut: [
		([self basicRichText] on: Error do: [:ex |
			Transcript showln: ('Error while parsing {1}: {2}' format: {self. ex}).
			'<i>Error while parsing formatted message text, below is the plain text:</i><br><br>{1}' asTextFromHtml format: {self plainText}])
				withBlanksTrimmed]