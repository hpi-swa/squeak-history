accessing - convenience
inReplyTo

	^ self wrapper inReplyTo
		ifNotNil: [:w | DemoMail on: w]