accessing - domain
plainText
	"Answer the plain text of the mail. May be a string or text."

	^ self valueOfProperty: #plainText ifAbsentPut: [
		self basicPlainText withBlanksTrimmed]