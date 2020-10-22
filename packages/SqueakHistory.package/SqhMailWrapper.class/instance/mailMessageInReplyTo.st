accessing - raw
mailMessageInReplyTo

	^ self
		valueOfProperty: #inReplyTo
		ifAbsentPut: [
			((self mailMessage fieldNamed: 'in-reply-to' ifAbsent: [])
				ifNotNil: [:mimeField | mimeField mainValue]
				"For invalid in-reply-to fields, use the references field. But only the last entry if there are multiple."
				ifNil: [(self mailMessage fieldNamed: 'references' ifAbsent: [])
					ifNotNil: [:mimeField | mimeField mainValue findTokens last]])
						ifNotNil: [:id | "Guard against broken mail headers. Avoid to create self-cycles."
							| tmp |
							tmp := self fixMessageId: id.
							tmp ~= self mailMessageMessageId
								ifTrue: [tmp] ifFalse: [nil]]]