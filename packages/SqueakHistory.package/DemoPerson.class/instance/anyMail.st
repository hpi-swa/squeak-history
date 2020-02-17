accessing - convenience
anyMail

	^ DemoMail on: (SqhMailmanAggregator messages
		detect: [:w | (DemoPerson at: w authorKey) == self])