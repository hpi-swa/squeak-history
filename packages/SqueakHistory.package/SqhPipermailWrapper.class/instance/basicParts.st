private
basicParts
	"Pipermail messages are no MIME documents but use their own syntax for separating parts."

	| fullText |
	fullText := self decode: super basicPlainText asString.
	^ fullText splitBy: '-------------- next part --------------'