accessing - domain
attachmentAt: index
	"Pipermail attachments are not included in the MailMessage but have to downloaded separately."

	| part url document |
	part := self basicParts at: index + 1.
	url := self urlFromPart: part.
	url ifNil: [^ MIMEDocument contentType: MIMEDocument contentTypePlainText content: part].
	
	document := url retrieveContents.
	"add name if missing"
	document name ifNil: [
		((self nameFromPart: part) ifNil: [(self urlFromPart: part) fileName]) ifNotNil: [:name |
			(document fieldNamed: 'content-disposition' ifAbsent: [])
				ifNotNil: [:field | field parameterAt: 'name' put: name]
				ifNil: [document setField: 'content-disposition' toString: 'attachment; filename="' , name , '"']]].
	
	"Really awful hack. Pipermail uses to convert *some* HTML messages to HTML twice, i.e., the parsed HTML text needs to be parsed as HTML again. It's not our fault..."
	(index = 1 and: [document name matchesRegex: '^attachment(-\d{4})?\.html?$'] and: [document isHTML]) ifTrue: [
		| content |
		self flag: #decoding.
		document content: ([document content utf8ToSqueak] ifError: [document content]).
		content := document bodyTextFormatted asString
			"nbsps are not part of HTML standard as supported by our parser."
			copyReplaceAll: (String value: 16rA0 "nbsp") with: String space.
		document content: content.
		
		"Document this conversion in the filename."
		document setField: 'content-disposition' toString: ('attachment; filename="{1}"' format:
			{'{1} (treated as HTML)' format: {document name}})].
	
	^ document