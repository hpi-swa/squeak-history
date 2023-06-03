enumerating - cached
messageLinesDo: workBlock 
	"Enumerate all non-empty lines in all mail messages."
	
	self messagesCachedDo: [:wrapper |
		wrapper mailMessage rawText linesDo: [:line |
			line withBlanksTrimmed ifNotEmpty: [:nonEmptyLine |			
				workBlock
					cull: nonEmptyLine "may be quote ('>') or regular"
					cull: wrapper mailMessage
					cull: wrapper listName]]]