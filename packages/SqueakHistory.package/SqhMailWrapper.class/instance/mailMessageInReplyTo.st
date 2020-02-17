accessing - raw
mailMessageInReplyTo

	^ self
		valueOfProperty: #inReplyTo
		ifAbsentPut: [
			(self mailMessage fieldNamed: 'in-reply-to' ifAbsent: [
				"For invalid in-reply-to fields, use the references field. But only the last entry if there are multiple."
				(self mailMessage fieldNamed: 'references' ifAbsent: [nil])])
				ifNotNil: [:mimeField | 
					mimeField mainValue findTokens last in: [:id |
						"Guard against broken mail headers. Avoid to create self-cycles."
						id ~= self mailMessageMessageId
							ifTrue: [id]
							ifFalse: []]]]