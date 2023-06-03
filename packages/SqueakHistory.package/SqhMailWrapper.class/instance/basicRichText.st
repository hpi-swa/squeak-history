private
basicRichText

	| message |
	message := self mailMessage.
	^ (message respondsTo: #bodyTextFormattedRich) ">= Network-ct.270"
		ifTrue: [message bodyTextFormattedRich]
		ifFalse: [message bodyTextFormatted]