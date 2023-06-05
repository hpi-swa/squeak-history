support
with: someObjects do: workBlock displayingProgress: progressStringOrBlock

	self showProgress
		ifTrue: [someObjects do: workBlock displayingProgress: progressStringOrBlock]
		ifFalse: [someObjects do: workBlock].