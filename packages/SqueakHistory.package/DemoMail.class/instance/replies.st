accessing - convenience
replies

	^ self wrapper replies
		collect: [:w | DemoMail on: w]