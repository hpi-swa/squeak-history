enumerating - convenience
messageQuoteLinesDo: workBlock
	"Whole corpus: 5'318'657 lines"
	
	self messageLinesDo: [:nonEmptyLine :mailMessage :listName |
		(self class isQuoteLine: nonEmptyLine) ifTrue: [			
			workBlock
				cull: nonEmptyLine "only quotes ('>')"
				cull: mailMessage
				cull: listName]].