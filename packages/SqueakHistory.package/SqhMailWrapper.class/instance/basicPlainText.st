private
basicPlainText

	| message |
	message := self mailMessage.
	^ (message respondsTo: #bodyTextFormatted:showAttachments:) ">= Network-ct.278 (Squeak 6.1)"
		ifTrue: [message bodyTextFormatted: false showAttachments: false]
		ifFalse: [message bodyTextFormatted]