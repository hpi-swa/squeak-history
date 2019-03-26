enumerating - convenience
messageRegularLinesDo: workBlock
	"Whole corpus: 8'351'571 lines"

	self messageLinesDo: [:nonEmptyLine :mailMessage :listName |
		(self class isQuoteLine: nonEmptyLine) ifFalse: [			
			workBlock
				cull: nonEmptyLine "only regular, non-quotes ('>')"
				cull: mailMessage
				cull: listName]].