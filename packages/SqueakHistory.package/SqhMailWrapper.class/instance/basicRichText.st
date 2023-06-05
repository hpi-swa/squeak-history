private
basicRichText

	| message |
	message := self mailMessage.
	^ (message respondsTo: #bodyTextFormatted:showAttachments:) ">= Network-ct.278 (Squeak 6.1)"
		ifTrue: [message bodyTextFormatted: true showAttachments: false]
		ifFalse: [message bodyTextFormatted]