reading
nextMessage

	self flag: #performance. "mt: #from: (or #new) is too expensive because of #initialize."
	^ MailMessage basicNew
		initializeFromString: self nextChunk;
		in: [:message |
			self assert: lastStart notNil.
			self assert: lastEnd notNil.
			
			message fields
				at: 'squeak-file-start' put: lastStart;
				at: 'squeak-file-end' put: lastEnd];
		yourself