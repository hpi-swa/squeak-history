preparation - private
httpGet: url

	| pendingRetries response |
	pendingRetries := 3.
	[response := [WebClient httpGet: url]
		on: ConnectionClosed do: [:ex |
			(pendingRetries := pendingRetries - 1) <= 0 ifTrue: [ex pass]]]
		whileNil: [response].
	response isSuccess ifFalse: [self error: response status].
	^ response content