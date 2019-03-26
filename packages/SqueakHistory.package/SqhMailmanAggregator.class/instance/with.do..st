support
with: someObjects do: workBlock

	self showProgress
		ifTrue: [someObjects do: workBlock displayingProgress: [:object | object asString]]
		ifFalse: [someObjects do: workBlock].