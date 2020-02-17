accessing - convenience
bodyFormatted

	| result |
	result := self text asText.
	2 to: result size do: [:index |
		(((result at: index-1) = Character lf) and: [(result at: index) = $>])
			ifTrue: [
				result addAttribute: (TextColor color: (Color gray: 0.7)) from: index to: ((result findString: String lf startingAt: index + 1) max: index)]].
	^ result